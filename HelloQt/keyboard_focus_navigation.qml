import QtQuick 2.0

Rectangle {
    width: 200
    height: 112
    color: "lightblue"
    TextInput {
        id: name_field
        anchors.left:parent.left
        y: 16
        anchors.right: parent.right
        text: "Name"
        font.pixelSize: 32
        color: focus ? "black" : "gray"
        focus: true
        KeyNavigation.tab: address_field
    }
    TextInput {
        id: address_field
        anchors.left:parent.left
        y: 64
        anchors.right: parent.right
        text: "Address"
        font.pixelSize: 32
        color: focus ? "black" : "gray"
        KeyNavigation.backtab: name_field
    }

}
