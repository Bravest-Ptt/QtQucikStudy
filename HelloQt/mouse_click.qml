import QtQuick 2.0

Rectangle {
    width: 400
    height: 200
    color: "lightblue"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Press me"
        font.pixelSize: 48

        MouseArea {
            anchors.fill: parent
            /*
            onPressed: {
                parent.color = "green"
                parent.font.pixelSize = 58;
            }
            onReleased:{
                parent.color = "black"
                parent.font.pixelSize = 48;
            }*/
            onClicked: {
                if (mouse.button == Qt.RightButton) {
                    parent.font.pixelSize = 38;
                } else {
                    parent.font.pixelSize = 58;
                }
            }
            acceptedButtons: Qt.LeftButton | Qt.RightButton
        }
    }
}
