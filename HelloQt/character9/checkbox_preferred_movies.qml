import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 320;
    height: 300;
    color: "#d0d0d0";
    Rectangle {
        id: resultHolder
        color: "#a0a0a0";
        width: 200;
        height: 80;
        anchors.centerIn: parent;
        visible: false;
        z: 2;
        opacity: 0.8;
        border.width: 2;
        border.color: "#808080";
        radius: 8;
        Text {
            id: result
            anchors.fill: parent;
            anchors.margins: 5;
            font.pixelSize: 16;
            color: "blue";
            font.bold: true;
            wrapMode: Text.Wrap;
        }
    }

    Component {
        id:checkStyle
        CheckBoxStyle {
            indicator: Rectangle  {
                implicitWidth: 14;
                implicitHeight: 14;

            }
        }
    }
}
