import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    visible: true
    width: 360
    height: 360
    title: "pengtian"
//    minimumHeight: 400
//    minimumWidth: 400
    color: "#abdfaa"

    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello Qt Quick App")
        anchors.centerIn: parent
    }
}
