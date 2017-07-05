import QtQuick 2.0

Rectangle {
    width: 400
    height: 400
    color: "black"
    Image {
        id: pretty_girl
        source:  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1264996776,4079453714&fm=26&gp=0.jpg"
        x: 150
        y: 150
        width: 100
        height: 100
        transformOrigin: parent.Center
    }
    Keys.onLeftPressed:
        pretty_girl.rotation = (pretty_girl.rotation - 10) % 360
    Keys.onRightPressed:
        pretty_girl.rotation = (pretty_girl.rotation + 10) % 360
    focus: true
}
