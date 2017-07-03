import QtQuick 2.5

Rectangle {
    width: 350
    height: 2 * 100
    color: "lightblue"
    Text {
        x:93;y: 73; width: 150
        wrapMode: Text.WordWrap
        font.pixelSize: 20; font.italic: true
        text: "Hello qt"
    }
}
