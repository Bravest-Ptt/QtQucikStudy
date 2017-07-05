import QtQuick 2.5

Rectangle {
    width: 400
    height: 400
    color: "gray"

    Rectangle {
        id: rect1
        width: 300
        height: 150
        x:50
        y:50
        color:"lightblue"
        Rectangle {
            width: 50
            height: 50
            x:50
            y:50
            color: "white"
        }
    }

    Rectangle {
        id: rect2
        width: 300
        height: 150
        anchors.top:rect1.bottom
        x:50
        y:0
        color:"green"
        Rectangle {
            x:-1
            y:50
            color:"blue"
            width: 150
            height: 50
        }
    }
}
