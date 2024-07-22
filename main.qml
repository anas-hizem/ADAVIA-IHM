import QtQuick 2.4
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("ADAVIA IHM")
    //visibility: "FullScreen"

    StackView {
        id: stackView
        initialItem: Dashboard{}
        anchors.fill: parent
    }

}
