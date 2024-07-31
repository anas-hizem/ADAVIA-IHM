import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0
import QtMultimedia 5.15

Rectangle {
    id: root
    NavBar {
        id: bottomBar
        anchors {
            left: root.left
            right: root.right
            bottom: root.bottom
        }
    }
    Rectangle {
        id:navetteContainer
        width: root.width * 1/2
        height: root.height
        color: "#546472"
        anchors {
            top: root.top
            right: root.right
            bottom: bottomBar.top
        }
        Text {
            id: tite
            text: qsTr("Camera Streaming ADAVIA")
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#BDD248"
            font.pixelSize: 50
            anchors.topMargin: 40

        }
        Image {
            id: navetteImage
            source: "assets/navette.png"
            anchors.centerIn: parent
            width: parent.width * 1.7
            fillMode: Image.PreserveAspectFit

        }
        // RowLayout {
        //     anchors.top: navetteImage.bottom
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     spacing: 50
        //     ColumnLayout{
        //         Slider {
        //             id: zoomSlider
        //             from: 1
        //             to: cameraStreamingAvant.maximumDigitalZoom
        //             value: 1
        //             onValueChanged: {
        //                 cameraStreamingAvant.digitalZoom = value
        //                 cameraStreamingArriere.digitalZoom = value
        //                 cameraStreamingRetroG.digitalZoom = value
        //                 cameraStreamingRetroD.digitalZoom = value
        //             }
        //         }

        //         Text {
        //             text: "Zoom: " + zoomSlider.value.toFixed(1)
        //             Layout.alignment: Qt.AlignHCenter                }

        //     }

        //     ColumnLayout{
        //         Slider {
        //             id: contrastSlider
        //             from: -1
        //             to: 1
        //             value: 0
        //             onValueChanged: {
        //                 cameraStreamingAvant.imageProcessing.contrast = value
        //                 cameraStreamingArriere.imageProcessing.contrast = value
        //                 cameraStreamingRetroG.imageProcessing.contrast = value
        //                 cameraStreamingRetroD.imageProcessing.contrast = value
        //             }
        //         }

        //         Text {
        //             text: "Contrast: " + contrastSlider.value.toFixed(1)
        //             Layout.alignment: Qt.AlignHCenter
        //         }
        //     }

        //     ColumnLayout{
        //         Slider {
        //             id: brightnessSlider
        //             from: -1
        //             to: 1
        //             value: 0
        //             onValueChanged: {
        //                 cameraStreamingAvant.imageProcessing.brightness = value
        //                 cameraStreamingArriere.imageProcessing.brightness = value
        //                 cameraStreamingRetroG.imageProcessing.brightness = value
        //                 cameraStreamingRetroD.imageProcessing.brightness = value
        //             }
        //         }

        //         Text {
        //             text: "Brightness: " + brightnessSlider.value.toFixed(1)
        //             Layout.alignment: Qt.AlignHCenter
        //         }
        //     }
        // }
        Item {
            id: cameraAvant
            width: 1
            height: 1
            anchors.top: navetteImage.top
            anchors.topMargin: 150
            anchors.left: navetteContainer.left
            anchors.leftMargin: 350
        }

        Item {
            id: cameraArriere
            width: 1
            height: 1
            anchors.top: navetteImage.top
            anchors.topMargin: 150
            anchors.right: navetteContainer.right
            anchors.rightMargin: 250
        }

        Item {
            id: cameraRetroG
            width: 1
            height: 1
            anchors.bottom: navetteImage.bottom
            anchors.bottomMargin: 400
            anchors.right: navetteContainer.right
            anchors.rightMargin: 400
        }

        Item {
            id: cameraRetroD
            width: 1
            height: 1
            anchors.bottom: navetteImage.bottom
            anchors.bottomMargin: 400
            anchors.left: navetteContainer.left
            anchors.leftMargin: 200
        }

        MouseArea {
            id: textAvantArea
            width: 50
            height: 50
            anchors.top: navetteImage.top
            anchors.topMargin: 20
            anchors.left: navetteContainer.left
            anchors.leftMargin: 250
            cursorShape: Qt.PointingHandCursor;
            onClicked: {
                cameraStreamingAvant.start();
                cameraStreamingArriere.stop()
                cameraStreamingRetroD.stop()
                cameraStreamingRetroG.stop()
            }
            Text {
                z:2
                text: "Avant"
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
            }
        }
        MouseArea {
            id: textArriereArea
            width: 100
            height: 100
            anchors.top: navetteImage.top
            anchors.topMargin: 20
            anchors.right: navetteContainer.right
            anchors.rightMargin: 250
            cursorShape: Qt.PointingHandCursor;
            onClicked: {
                cameraStreamingArriere.start();
                cameraStreamingAvant.stop()
                cameraStreamingRetroD.stop()
                cameraStreamingRetroG.stop()
            }
            Text {
                z:2
                text: "Arrière"
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
            }
        }
        MouseArea {
            id: textRetroGArea
            width: 100
            height: 100
            anchors.bottom: navetteImage.bottom
            anchors.bottomMargin: 20
            anchors.right: navetteContainer.right
            anchors.rightMargin: 250
            cursorShape: Qt.PointingHandCursor;
            onClicked: {
                cameraStreamingRetroG.start();
                cameraStreamingAvant.stop()
                cameraStreamingRetroD.stop()
                cameraStreamingArriere.stop()
            }
            Text {
                z:2
                text: "Rétro G"
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
            }
        }

        MouseArea {
            id: textRetroDArea
            width: 100
            height: 100
            anchors.bottom: navetteImage.bottom
            anchors.bottomMargin: 20
            anchors.left: navetteContainer.left
            anchors.leftMargin: 90
            cursorShape: Qt.PointingHandCursor;
            onClicked: {
                cameraStreamingRetroD.start();
                cameraStreamingAvant.stop()
                cameraStreamingRetroG.stop()
                cameraStreamingArriere.stop()
            }
            Text {
                z:2
                text: "Rétro D"
                anchors.centerIn: parent
                font.pixelSize: 25
                font.bold: true
            }
        }
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
                ctx.moveTo(cameraAvant.x +2  + cameraAvant.width / 2, cameraAvant.y + cameraAvant.height / 2);
                ctx.lineTo(textAvantArea.x + 50 + textAvantArea.width / 2, textAvantArea.y + textAvantArea.height / 2);
                ctx.stroke();

                ctx.beginPath();
                ctx.moveTo(cameraArriere.x + cameraArriere.width / 2, cameraArriere.y + cameraArriere.height / 2);
                ctx.lineTo(textArriereArea.x + textArriereArea.width / 2, textArriereArea.y + 20 + textArriereArea.height / 2);
                ctx.stroke();

                ctx.beginPath();
                ctx.moveTo(cameraRetroG.x + cameraRetroG.width / 2, cameraRetroG.y + cameraRetroG.height / 2);
                ctx.lineTo(textRetroGArea.x + textRetroGArea.width / 2, textRetroGArea.y - 20 + textRetroGArea.height / 2);
                ctx.stroke();

                ctx.beginPath();
                ctx.moveTo(cameraRetroD.x + cameraRetroD.width / 2, cameraRetroD.y + cameraRetroD.height / 2);
                ctx.lineTo(textRetroDArea.x + textRetroDArea.width / 2, textRetroDArea.y - 20 + textRetroDArea.height / 2);
                ctx.stroke();
            }
        }
    }
    //partie camera
    Rectangle {
        id:cameraContainer
        width: root.width * 1/2
        height: root.height
        anchors {
            top: root.top
            bottom: bottomBar.top
        }
        onVisibleChanged: {
            if (!visible) {
                cameraStreamingAvant.stop();
                cameraStreamingArriere.stop();
                cameraStreamingRetroG.stop();
                cameraStreamingRetroD.stop();
            }
        }

        Component.onDestruction: {
            cameraStreamingAvant.stop();
            cameraStreamingArriere.stop();
            cameraStreamingRetroG.stop();
            cameraStreamingRetroD.stop();
        }
        Rectangle {
            id: cameraAvantArea
            width: cameraContainer.width / 2
            height: cameraContainer.height / 2
            color: "#39B54B"
            anchors.left: cameraContainer.left
            anchors.top: cameraContainer.top

            Rectangle {
                id: cameraAvantRectangle
                width: cameraAvantArea.width - 100
                height: cameraAvantArea.height - 100
                anchors.centerIn: cameraAvantArea
                color: "#39B54B"
                Camera {
                    id: cameraStreamingAvant
                }
                VideoOutput {
                    source: cameraStreamingAvant
                    anchors.fill: parent
                    fillMode:   VideoOutput.PreserveAspectCrop // VideoOutput.PreserveAspectFit , , VideoOutput.Stretch
                    visible: cameraStreamingAvant.cameraStatus === Camera.ActiveStatus
                }
                Image {
                    id: placeholderImageAvant
                    source: "assets/logoactiawhite.png"
                    //anchors.fill: parent
                    width: parent.width
                    anchors.centerIn: parent
                    visible: cameraStreamingAvant.cameraStatus !== Camera.ActiveStatus
                }
            }
        }
        Rectangle {
            id: cameraArriereArea
            width: cameraContainer.width / 2
            height: cameraContainer.height / 2
            color: "#BDD248"
            anchors.right: cameraContainer.right
            anchors.top: cameraContainer.top

            Rectangle {
                id: cameraArriereRectangle
                width: cameraArriereArea.width - 100
                height: cameraArriereArea.height - 100
                anchors.centerIn: cameraArriereArea
                color: "#BDD248"
                Camera {
                    id: cameraStreamingArriere
                }
                VideoOutput {
                    source: cameraStreamingArriere
                    anchors.fill: parent
                    fillMode:   VideoOutput.PreserveAspectCrop // VideoOutput.PreserveAspectFit , , VideoOutput.Stretch
                    visible: cameraStreamingArriere.cameraStatus === Camera.ActiveStatus

                }
                Image {
                    id: placeholderImageArriere
                    source: "assets/logoactia.png"
                    width: parent.width
                    anchors.centerIn: parent
                    visible: cameraStreamingArriere.cameraStatus !== Camera.ActiveStatus
                }
            }
        }
        Rectangle {
            id: cameraRetroGArea
            width: cameraContainer.width / 2
            height: cameraContainer.height / 2
            color: "#90969D"
            anchors.right: cameraContainer.right
            anchors.top: cameraAvantArea.bottom

            Rectangle {
                id: cameraRetroGRectangle
                width: cameraRetroGArea.width - 100
                height: cameraRetroGArea.height - 100
                anchors.centerIn: cameraRetroGArea
                color: "#90969D"
                Camera {
                    id: cameraStreamingRetroG
                }
                VideoOutput {
                    source: cameraStreamingRetroG
                    anchors.fill: parent
                    fillMode:   VideoOutput.PreserveAspectCrop // VideoOutput.PreserveAspectFit , , VideoOutput.Stretch
                    visible: cameraStreamingRetroG.cameraStatus === Camera.ActiveStatus

                }
                Image {
                    id: placeholderImageRetroG
                    source: "assets/logoactiawhite.png"
                    //anchors.fill: parent
                    width: parent.width
                    anchors.centerIn: parent
                    visible: cameraStreamingRetroG.cameraStatus !== Camera.ActiveStatus
                }
            }
        }

        Rectangle {
            id: cameraRetroDArea
            width: cameraContainer.width / 2
            height: cameraContainer.height / 2
            color: "#2BC3EA"
            anchors.left: cameraContainer.left
            anchors.top: cameraArriereArea.bottom

            Rectangle {
                id: cameraRetroDRectangle
                width: cameraRetroDArea.width - 100
                height: cameraRetroDArea.height - 100
                anchors.centerIn: cameraRetroDArea
                color: "#2BC3EA"
                Camera {
                    id: cameraStreamingRetroD
                }
                VideoOutput {
                    source: cameraStreamingRetroD
                    anchors.fill: parent
                    fillMode: VideoOutput.PreserveAspectCrop //VideoOutput.PreserveAspectFit VideoOutput.Stretch,
                    visible: cameraStreamingRetroD.cameraStatus === Camera.ActiveStatus

                }
                Image {
                    id: placeholderImageRetroD
                    source: "assets/logoactiagray.png"
                    //anchors.fill: parent
                    width: parent.width
                    anchors.centerIn: parent
                    visible: cameraStreamingRetroD.cameraStatus !== Camera.ActiveStatus
                }
            }
        }
    }
}
