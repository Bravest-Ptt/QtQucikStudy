import QtQuick 2.0

Rectangle {
    id: myitem
    signal hello(string msg)

    width: 100;
    height: 100;

    MouseArea {
        anchors.fill: parent
        onClicked: myitem.hello("click item")
    }
}
