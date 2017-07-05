import QtQuick 2.5

Rectangle {
    id: root
    width: 200
    height: 100

    Rectangle {
        id: rect1
        color: "blue"
        width: 100
        height: 100
    }

    Rectangle {
        id: rect2
        color: "red"
        width: 100
        height: 100
        anchors.left: rect1.right
        anchors.top: rect1.bottom
        anchors.leftMargin: 5
    }
}



