import QtQuick 2.0
import AppListModel 1.0
import QtQml.Models 2.2

GridView {
    id:page

    property alias pageModel: page.model
    property Rectangle root

    interactive: false
    anchors.margins: 16

    model: ListModel {}

    delegate: Component {
        id:delegateCom
        Item {
            id: item
            width: page.cellWidth != null ? page.cellWidth : 0;
            height: page.cellHeight != null ? page.cellHeight : 0;
            Column {
                id: column
                property string name: text.text
                anchors.fill: parent
                height: width
                Image {
                    id: image
                    source: icon
                    width: page.cellWidth / 5 * 4
                    height: width
                    anchors.horizontalCenter: parent.horizontalCenter
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.detailPage.icon = image;
                            root.detailPage.name = column.name;
                            console.log("name = " +column.name);
                            root.state = "detail"
                        }
                        onPressed: {
                            image.opacity = 0.7
                            image.scale = 0.98
                        }

                        onReleased: {
                            image.opacity = 1
                            image.scale = 1
                        }
                    }
                }
                Text {
                    id:text
                    text: name
                    width: page.cellWidth / 5 * 4;
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 2
                    color: "#FFFFFF"
                }
            }
        }
    }

}
