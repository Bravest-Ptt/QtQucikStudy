import QtQuick 2.0

Rectangle {
    width: 500
    height: 100
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: time.text = Date().toString()
    }

    Text {
        id: time
        width: parent.width
        height: parent.height
        color: "black"
    }
}
