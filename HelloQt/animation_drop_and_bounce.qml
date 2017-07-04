import QtQuick 2.0

Rectangle {
    id: rect
    width: 120;
    height: 200
    Image {
        id: img
        source: "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1682686082,380056728&fm=26&gp=0.jpg"
        x: 60 - img.width / 2
        y: 0

        SequentialAnimation on y {
            running: true
            loops: Animation.Infinite
            NumberAnimation {
                to: 200 - img.height
                easing.type: "OutBounce"
                duration: 2000
            }

            PauseAnimation {
                duration: 1000
            }
            NumberAnimation {
                to: 0
                easing.type: "OutQuad"
                duration: 1000
            }
        }
    }
}
