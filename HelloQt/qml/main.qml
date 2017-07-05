import QtQuick 2.5

Rectangle {
    width: 350
    height: 2 * 100
    color: "lightblue"

    Rectangle {
        width: 150
        anchors.right: parent.right
        height: parent.height
        color: "blue"

        Image {
            id: pretty_girl
            smooth: true
            fillMode: Image.PreserveAspectFit
            width: parent.width
            height: parent.height
            opacity: 0.6
            source: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1264996776,4079453714&fm=26&gp=0.jpg"
        }
    }



    Text {
        x: 50
        y: 20
        width: 150
        opacity: 0.5
        wrapMode: Text.WordWrap
        font.pixelSize: 20
        font.italic: true
        text: "<html><b>Blessed are those with wooden heads for not being able to drown.</b></html>"
    }
}
