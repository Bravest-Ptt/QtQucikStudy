import QtQuick 2.0

Grid {
    columns: 2
    spacing: 10
    Rectangle {
        id: rect_1
        color: focus ? "lightblue" : "blue"
        width: 100
        height: 100
        focus: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.focus = true
            }
        }
        KeyNavigation.left: rect_4
        KeyNavigation.right: rect_2
        KeyNavigation.up:rect_3
        KeyNavigation.down: rect_3
    }

    Rectangle {
        id: rect_2
        color: focus ? "lightgreen" : "green"
        width: 100
        height: 100
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        KeyNavigation.left: rect_1
        KeyNavigation.right: rect_3
        KeyNavigation.up:rect_4
        KeyNavigation.down: rect_4
    }

    Rectangle {
        id: rect_3
        color: focus ? "black" : "gray"
        width: 100;
        height: 100
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        KeyNavigation.left: rect_2
        KeyNavigation.right: rect_4
        KeyNavigation.up:rect_1
        KeyNavigation.down: rect_1
    }

    Rectangle {
        id: rect_4
        color: focus ? "red" : "magenta"
        width: 100
        height: 100
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        KeyNavigation.left: rect_3
        KeyNavigation.right: rect_1
        KeyNavigation.up:rect_2
        KeyNavigation.down: rect_2
    }
}
