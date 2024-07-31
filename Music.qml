import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "./music/qml/components"
import "./music/qml/views"
import "./music/qml/delegates"

Rectangle {
    id:root
    width: (rightScreen.width / 2) - 10
    height: (rightScreen.height * 1 / 4) - 20
    anchors{
        left: rightScreen.left
        bottom: rightScreen.bottom
    }
    radius: 20


    property string foreColor: Theme.fontColor
    property alias fontAwesomeFontLoader: fontAwesomeFontLoader


    FontLoader
    {
        id: fontAwesomeFontLoader
        source: "music/assets/fonts/fontawesome.otf"
    }


    /**********************************Music ***************/

    property alias mainQmlApp: root
    property string darkThemeColor: Theme.background
    //property alias stackLayout: stackLayout
    property alias menuDelegatePopup: menuDelegatePopup
    property alias menuPopup: menuPopup

    property bool isMusicPlaying: false
    property bool isMusicPaused: false
    property bool isShuffleEnabled: false
    property int repeatIndex: 0
    property int currentMusicIndex: 0
    property int clickedIndex: -1

    property int playerPosition: 0
    property int playerDuration: 0

    property real yCoordinate: 0

    property string musicTitle_ : ""
    property string artistName: "Unknown Artist"

    property ListModel musicModel: ListModel {}

    Component
    {
        id: musicDelegate

        MusicDelegate{
            no: _no
            musictitle: _title
            musiclength: _length
            isCurrentlySelected: index === mainQmlApp.currentMusicIndex

            onClicked: {
                listView.currentIndex = index
                mainQmlApp.currentMusicIndex = listView.currentIndex
                mainQmlApp.isMusicPlaying = !mainQmlApp.isMusicPlaying
                mainQmlApp.isMusicPlaying  = true
            }

            onMenuClicked: {
                clickedIndex = index
                var globalCoord = mouseArea.mapToItem(root, 0, 0)
                mainQmlApp.yCoordinate = globalCoord.y
                mainQmlApp.menuDelegatePopup.open()
            }
        }
    }

    RotationAnimator {
        loops: Animation.Infinite
        target: rotatingIconSmall;
        from: 0;
        to: 360;
        duration: 3000
        running: mainQmlApp.isMusicPlaying
    }


    function updateTitles()
    {
        if(musicModel.count>0)
        {
            try{

                musicTitle_ = musicModel.get(currentMusicIndex)._title

            } catch (err)
            {

            }
        }
    }

    function getArtist()
    {
        if(musicModel.count>0)
        {
            musicTitle_ = musicModel.get(currentMusicIndex)._title

            var artist = musicTitle_.split("-")[0]

            artistName = artist===""? "Unknown Artist":artist.length>40? artist.slice(0,39)+" ...":artist

        }
    }

    onMusicTitle_Changed: getArtist()

    onIsMusicPlayingChanged: {
        if(mainQmlApp.isMusicPlaying)
            QmlInterface.startPlaying()

        else
            QmlInterface.pausePlaying()
    }

    onIsMusicPausedChanged: {
        if(mainQmlApp.isMusicPaused)
            QmlInterface.pausePlaying()

        else
            QmlInterface.startPlaying()
    }

    onIsShuffleEnabledChanged: {
        QmlInterface.setShuffle(isShuffleEnabled);
    }

    onRepeatIndexChanged: {
        QmlInterface.setPlaybackMode(repeatIndex);
    }

    onCurrentMusicIndexChanged: {
        QmlInterface.setCurrentIndex(currentMusicIndex)

        updateTitles()
    }

    Connections
    {
        target: QmlInterface

        function onMusicIndexChanged() {
            // Changed from Qt player

            if(mainQmlApp.currentMusicIndex !== QmlInterface.getCurrentMusicIndex())
                mainQmlApp.currentMusicIndex = QmlInterface.getCurrentMusicIndex()
        }

        function onMusicListSizeChanged() {
            // Update music list

            musicModel.clear()

            for(var i=0; i<data.length; i++)
                musicModel.append({"_no":i+1, "_title":data[i], "_length":"03.20"})

            updateTitles()
        }

        function onPlayerPositionChanged(data) {
            console.log("Position: ", data)
            playerPosition = data;
        }

        function onMusicDurationChanged(data) {
            console.log("Length: ", data)
            playerDuration = data;
        }
    }

    MenuPopup
    {
        id: menuPopup
        x: root.width - 50 - width
        y: 5
    }

    MusicDelegateMenuPopup
    {
        id: menuDelegatePopup

        x: root.width - 50 - width
        y: yCoordinate

        onClosed: clickedIndex = -1
    }
    /**********************************End Music************/


    function createMusicDialog(){
        var component = Qt.createComponent("music/qml/Music.qml");
        var win = component.createObject(root);
        if (win !== null) {
            win.x = leftScreen.width + 20;
            win.y = mapArea.height + musicPane.height - win.height + 10;
            win.onHeightChanged.connect(function() {
                win.x = leftScreen.width + 20;
                win.y = mapArea.height - win.height + 10;
            });
            win.show();
        }
    }

    Rectangle{
        anchors.fill: parent
        color: "#A1CD3C"
        radius: 20
        function loadAudio()
        {
            musicModel.clear()
            var musicList = QmlInterface.getAllAudioFiles()

            console.log(">> ", musicList)
            console.log("Music List :: ",JSON.stringify(musicList))

            for(var i = 0; i<musicList.length; i++)
            {
                console.log("--> ", musicList[i])

                musicModel.append({"_no":i+1, "_title":musicList[i], "_length":"03.20"});
            }

            mainQmlApp.updateTitles()
        }

        Component.onCompleted: loadAudio()
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        RowLayout{
            Layout.leftMargin: 20
            Layout.alignment: Qt.AlignLeft
            spacing: 30

            IconButton{
                Layout.alignment: Qt.AlignVCenter
                roundIcon: true
                implicitHeight: 100
                implicitWidth: 100
                iconHeight: 100
                iconWidth: 100
                radius:16
                setIcon: "assets/spotify.svg"
            }

            ColumnLayout{
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                spacing: 5
                Text{
                    id: txt
                    color: mainQmlApp.foreColor; font.pixelSize: 18
                    text: musicTitle_.length>35? musicTitle_.slice(0,35)+"...":musicTitle_
                }

                Text {
                    Layout.preferredHeight: 20
                    color: mainQmlApp.foreColor; font.pixelSize: 14
                    text: artistName
                }
                RowLayout{
                    Layout.fillWidth: true
                    spacing: 25

                    Slider{
                        from:0
                        to: 100
                        value: playerDuration === 0? 0:(playerPosition * 100)/playerDuration
                        Layout.alignment: Qt.AlignHCenter
                    }
                    AppIcon{
                        id: rotatingIconSmall;
                        icon: "\uf51f";
                        color: "#516b8e"
                        size: 32
                    }
                }
            }
        }
        RowLayout
        {
            Layout.alignment: Qt.AlignHCenter
            spacing: 75
            IconButton{
                implicitHeight: 55
                implicitWidth: 55
                radius:16
                checked:mainQmlApp.isShuffleEnabled
                checkable: true
                setIconColor :checked ? Theme.checkedIconColor : foreColor
                setIconText: "\uf074"
                onCheckedChanged: {
                    mainQmlApp.isShuffleEnabled = checked
                }
            }
            IconButton{
                implicitHeight: 55
                implicitWidth: 55
                radius:16
                setIconColor : mainQmlApp.foreColor
                setIconText: "\uf04a"
                onClicked: QmlInterface.playPrevious()
            }

            IconButton{
                implicitHeight: 60
                implicitWidth: 60
                radius: 30
                iconBackground: mainQmlApp.isMusicPlaying ? "#2bbe6d" : "transparent"
                setIconColor : mainQmlApp.foreColor
                setIconText: mainQmlApp.isMusicPlaying? "\uf04c":"\uf04b"
                onClicked: {
                    if(!mainQmlApp.isMusicPlaying)
                    {
                        if(musicModel.count>0)
                            mainQmlApp.isMusicPlaying = !mainQmlApp.isMusicPlaying
                    }
                    else
                        mainQmlApp.isMusicPlaying = !mainQmlApp.isMusicPlaying
                }
            }

            IconButton{
                implicitHeight: 55
                implicitWidth: 55
                radius:16
                setIconColor : mainQmlApp.foreColor
                setIconText: "\uf04e"
                onClicked: QmlInterface.playNext()
            }

            IconButton{
                implicitHeight: 55
                implicitWidth: 55
                radius:16
                setIconColor : mainQmlApp.repeatIndex === 0? foreColor: Theme.checkedIconColor
                setIconText: mainQmlApp.repeatIndex === 1? "\uf366":"\uf364"
                onClicked: {
                    mainQmlApp.repeatIndex += 1
                    if(mainQmlApp.repeatIndex === 3)
                        mainQmlApp.repeatIndex = 0
                }
            }
        }
    }



}
