import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Rectangle {
    id: root
    color: "#546472"
    visible: true
    NavBar {
        id: bottomBar
        anchors {
            left: root.left
            right: root.right
            bottom: root.bottom
        }
    }
    Text {
        id: tite
        text: qsTr("Ultrason Sensor Detection ADAVIA")
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#BDD248"
        font.pixelSize: 50
    }

    // Image de la navette en vue de dessus
    Image {
        id: navetteImage
        source: "assets/navette-vue-dessus2.png"
        anchors {
            centerIn: parent
            top: root.top
            bottom: bottomBar.top
        }
        width: parent.width / 2
        height: parent.height / 2
    }


    // Liste des capteurs ultrasoniques avec leur position
    Repeater {
        model: ListModel {
            ListElement { x: 450; y: 560; label: "Avant Gauche"; angle: 0; }
            ListElement { x: 450; y: 390; label: "Avant Droit"; angle: 0; }
            ListElement { x: 1370; y: 560; label: "Arrière Gauche"; angle: 180; }
            ListElement { x: 1370; y: 390; label: "Arrière Droit"; angle: 180; }
            ListElement { x: 950; y: 670; label: "Côté Gauche"; angle: 270; }
            ListElement { x: 950; y: 290; label: "Côté Droit"; angle: 90; }
        }

        Item {
            width: 50
            height: 50
            // Canvas {
            //     id: waveCanvas
            //     width: 250
            //     height: 250
            //     anchors.centerIn: parent

            //     property real baseTime: Date.now()


            //     onPaint: {
            //         var ctx = getContext("2d");
            //         ctx.clearRect(0, 0, width, height);


            //         // Dessiner trois ondes ultrasoniques successives
            //         for (var i = 0; i < 3; i++) {
            //             var offsetTime = i * 200; // Décalage pour chaque onde
            //             var currentTime = (Date.now() - baseTime + offsetTime) / 600;
            //             var radius = (waveCanvas.width / 2) - (waveCanvas.width / 2) * Math.sin(currentTime);

            //             // Calculer la direction des ondes vers la cible
            //             var centerX = width / 2;
            //             var centerY = height / 2;
            //             var angleInRadians = angle * Math.PI / 180;


            //             ctx.beginPath();
            //             ctx.arc(centerX, centerX, radius, angleInRadians - Math.PI / 4 , angleInRadians + Math.PI / 4);
            //             ctx.lineWidth = 4; // Épaisseur des arcs
            //             ctx.strokeStyle ="rgba(255, 0, 0, 0.8)";
            //             //ctx.strokeStyle ="rgba(0, 128, 0, 0.8)";
            //             //ctx.strokeStyle ="rgba(255, 165, 0 , 0.8)";
            //             ctx.stroke();
            //         }
            //     }

            //     Timer {
            //         interval: 50
            //         running: true
            //         repeat: true
            //         onTriggered: waveCanvas.requestPaint()
            //     }
            // }

            Image {
                id: waveImage
                anchors.centerIn: parent
                source: "assets/green-wave-01.png"
                width: 350
                height: 250
                property int frame: 0
                property var waveImages: ["assets/green-wave-01.png", "assets/green-wave-02.png", "assets/green-wave-03.png", "assets/green-wave-04.png", "assets/green-wave-05.png"]
                property int interval: 300

                Timer {
                    interval: waveImage.interval // Intervalle de temps pour changer les images
                    running: true
                    repeat: true
                    onTriggered: {
                        waveImage.frame = (waveImage.frame + 1) % waveImage.waveImages.length;
                        waveImage.source = waveImage.waveImages[waveImage.frame];
                    }
                }

                transform: Rotation {
                    id: waveRotation
                    origin.x: waveImage.width / 2
                    origin.y: waveImage.height / 2
                    angle: model.angle
                }

                // Fonction pour ajuster les images et l'intervalle de temps
                function updateAppearance(distance) {
                    if (distance < 1) {
                        waveImage.waveImages = ["assets/red-wave-01.png", "assets/red-wave-02.png", "assets/red-wave-03.png", "assets/red-wave-04.png", "assets/red-wave-05.png"];
                        waveImage.interval = 100;
                    } else if (distance >= 1 && distance <= 2) {
                        waveImage.waveImages = ["assets/orange-wave-01.png", "assets/orange-wave-02.png", "assets/orange-wave-03.png", "assets/orange-wave-04.png", "assets/orange-wave-05.png"];
                        waveImage.interval = 200;
                    } else {
                        waveImage.waveImages = ["assets/green-wave-01.png", "assets/green-wave-02.png", "assets/green-wave-03.png", "assets/green-wave-04.png", "assets/green-wave-05.png"];
                        waveImage.interval = 300;
                    }
                }
            }

            // Position des capteurs
            x: model.x
            y: model.y
            Text {
                text: {
                    var distance;
                    switch (model.label) {
                        case "Avant Gauche": distance = ultrasonSensor.avantGauche; break;
                        case "Avant Droit": distance = ultrasonSensor.avantDroit; break;
                        case "Arrière Gauche": distance = ultrasonSensor.arriereGauche; break;
                        case "Arrière Droit": distance = ultrasonSensor.arriereDroit; break;
                        case "Côté Gauche": distance = ultrasonSensor.coteGauche; break;
                        case "Côté Droit": distance = ultrasonSensor.coteDroit; break;
                        default: distance = 0;
                    }
                    waveImage.updateAppearance(distance);
                    return distance.toFixed(2) + " m";
                }
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "black"
            }
        }
    }

    // // MouseAreas pour les textes avec les positions des capteurs

    MouseArea {
        id: textAvantDArea
        x: 300
        y: 200
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Avant Droite"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceAvantDText
                text: "Distance: " + ultrasonSensor.avantDroit + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
    MouseArea {
        id: textAvantGArea
        x: 300
        y: 750
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Avant Gauche"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceAvantGText
                text: "Distance: " + ultrasonSensor.avantGauche + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
    MouseArea {
        id: textArriereGArea
        x: 1350
        y: 800
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Arrière Gauche"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceArriereGText
                text: "Distance: " + ultrasonSensor.arriereGauche + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
    MouseArea {
        id: textArriereDArea
        x: 1350
        y: 150
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Arrière Droite"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceArriereDText
                text: "Distance: " + ultrasonSensor.arriereDroit + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
    MouseArea {
        id: textCoteDArea
        x: 850
        y: 150
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Côté Droite"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceCoteDText
                text: "Distance: " + ultrasonSensor.coteDroit + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
    MouseArea {
        id: textCoteGArea
        x: 850
        y: 800
        width: 200
        height: 100

        Column {
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: "Capteur Côté Gauche"
                font.pixelSize: 25
                font.bold: true
            }
            Text {
                id: distanceCoteGText
                text: "Distance: " + ultrasonSensor.coteGauche + " m"
                color: "black"
                font.pixelSize: 20
            }
        }
    }

    // Canvas pour tracer les lignes entre les capteurs et les textes
    Canvas {
        id: linesCanvas
        width: parent.width
        height: parent.height
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Tracer les lignes
            ctx.beginPath();
            ctx.moveTo(520, 380); // Avant Droit
            ctx.lineTo(textAvantDArea.x  + textAvantDArea.width / 2, textAvantDArea.y + 40 + textAvantDArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(520,620); // Avant Gauche
            ctx.lineTo(textAvantGArea.x + textAvantGArea.width / 2, textAvantGArea.y - 40  + textAvantGArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(1370, 620); // Arrière Gauche
            ctx.lineTo(textArriereGArea.x  + textArriereGArea.width / 2, textArriereGArea.y - 40 + textArriereGArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(1370, 370); // Arrière Droit
            ctx.lineTo(textArriereDArea.x + textArriereDArea.width / 2, textArriereDArea.y + 40 + textArriereDArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(970, 350); // Côté Droit
            ctx.lineTo(textCoteDArea.x + textCoteDArea.width / 2, textCoteDArea.y + 40 + textCoteDArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(970, 660); // Côté Gauche
            ctx.lineTo(textCoteGArea.x + textCoteGArea.width / 2, textCoteGArea.y  - 40 + textCoteGArea.height / 2);
            ctx.stroke();
        }
    }
}
