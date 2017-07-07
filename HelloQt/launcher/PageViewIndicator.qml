import QtQuick 2.0

Row {
    // 绑定的ListView组件
    property ListView target;

    spacing: 20
    Repeater {
        opacity: 0.8
        model: target.model.count
        Rectangle {
            width: 5; height: 5
            radius: 3
            color: target.currentIndex == index ? "white" : "grey"
            scale: target.currentIndex == index ? 1.2 : 1.0
            MouseArea {
                width: 20; height: 20
                anchors.centerIn: parent
                onClicked: target.currentIndex = index
            }
        }
    }
}
