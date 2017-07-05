import QtQuick 2.0

//when i click the item, it will jump to page1
Item {
    width: 200; height: 200

    Loader { id: pageLoader }

    MouseArea {
        anchors.fill: parent
        onClicked: pageLoader.source = "Page1.qml"
    }
}
