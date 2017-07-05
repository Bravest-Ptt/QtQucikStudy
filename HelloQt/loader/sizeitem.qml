import QtQuick 2.0

//The red rectangle will be 50x50, centered in the root item.
Item {
    width: 200; height: 200

    Loader {
        anchors.centerIn: parent
        sourceComponent: rect
    }

    Component {
        id: rect
        Rectangle {
            width: 50
            height: 50
            color: "red"
        }
    }
}
