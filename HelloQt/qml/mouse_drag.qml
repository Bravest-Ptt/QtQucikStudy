import QtQuick 2.0

Rectangle {
    id: opacitytest
    width: 600
    height: 400
    color: "white"
    Image {
        id: pic
        source: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1264996776,4079453714&fm=26&gp=0.jpg"
        anchors.verticalCenter: parent.verticalCenter
        opacity: (600.0-pic.x) / 600;
        MouseArea {
            anchors.fill: parent
            drag.target: pic
            drag.axis: "XAxis"
            drag.minimumX: 0
            drag.maximumX: opacitytest.width - pic.width
        }
    }
}
