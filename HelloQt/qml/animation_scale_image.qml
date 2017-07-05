import QtQuick 2.0

Rectangle {
    id: rect
    width: 100
    height: 100

    Image {
        id: image
        width: parent.width
        height: parent.height
        source: "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1682686082,380056728&fm=26&gp=0.jpg"
        MouseArea {
            anchors.fill: parent
            onClicked: animation.start()
        }
    }
    PropertyAnimation {
        id: animation
        target: image
        property: "scale"
        from: 1
        to: 0.5
    }
}
