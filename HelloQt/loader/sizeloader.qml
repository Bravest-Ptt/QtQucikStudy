import QtQuick 2.0

//The red rectangle will be sized to the size of the root item.
Item {
    width: 200; height: 200

    Loader {
        // Explicitly set the size of the loader to the parent item's size
        anchors.fill: parent
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
