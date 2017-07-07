import QtQuick 2.0

Rectangle{
    id:detailPage
    property string name;
    property Image icon;

    width: parent.width
    height: parent.height

    Column {
        spacing: 5
        Image {
            id: icon
            source: detailPage.icon.source
            width: detailPage.icon.width
            height: width
            anchors.centerIn: parent.Center
        }
        Text {
            id: name
            text: detailPage.name
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#FFFFFF"
        }
    }
}
