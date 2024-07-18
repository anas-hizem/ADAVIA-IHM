import QtQuick 2.4
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("ADAVIA IHM")

    StackView {
        id: stackView
        initialItem: Dashboard {}
        anchors.fill: parent
    }

}
