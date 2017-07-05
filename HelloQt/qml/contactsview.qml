import QtQuick 2.0


Rectangle {
    width: 320
    height: 320
    Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth
            height: grid.cellHeight

            Column {
                Image {
                    width: grid.cellWidth
                    height: grid.cellHeight - text.height
                    source: avator;
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id:text
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 80
        cellHeight: 80
        model: ContactsModel{}
        snapMode: GridView.SnapToRow
        flow: GridView.TopToBottom
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}
