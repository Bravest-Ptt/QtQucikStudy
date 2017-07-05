import QtQuick 2.0

Rectangle {
    width: 400
    height: 100
    Rectangle {
        id: rect
        color: "red"
        width: 200
        height: 100
        x: 10
        Behavior on x {
            NumberAnimation { duration: 300; easing.type: "InOutQuad" }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (parent.x <= 90 && parent.x >=0) {
                    parent.x += 10;
                    console.log("parent x = " + parent.x)
                } else if(parent.x == 100) {
                    parent.x = 0
                }
            }
        }
    }
}
