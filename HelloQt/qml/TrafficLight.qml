import QtQuick 2.0
import "getdate.js" as DateUtil

Rectangle {
    id: light
    color: "black"
    width: 110
    height: 330
    Rectangle {
        id: background
        color: "black"
        width: 110
        height: 320
        anchors.verticalCenter: parent.verticalCenter
        state: "red_light"

        Rectangle {
            id: red_rect
            width: 100
            height: 100
            radius: 180
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            color: "red"
        }

        Rectangle {
            id: yellow_rect
            width: 100
            height: 100
            radius: 180
            anchors.top: red_rect.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "yellow"
        }

        Rectangle {
            id: green_rect
            width: 100
            height: 100
            radius: 180
            anchors.top: yellow_rect.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "green"
        }
        states: [
            State {
                name: "red_light"
                PropertyChanges {
                    target: red_rect
                    color: "red"
                }
                PropertyChanges {
                    target: yellow_rect
                    color: "gray"
                }
                PropertyChanges {
                    target: green_rect
                    color: "gray"
                }
            },

            State {
                name: "yellow_light"
                PropertyChanges {
                    target: red_rect
                    color: "gray"
                }
                PropertyChanges {
                    target: yellow_rect
                    color: "yellow"
                }
                PropertyChanges {
                    target: green_rect
                    color: "gray"
                }
            },

            State {
                name: "green_light"
                PropertyChanges {
                    target: red_rect
                    color: "gray"
                }
                PropertyChanges {
                    target: yellow_rect
                    color: "gray"
                }
                PropertyChanges {
                    target: green_rect
                    color: "green"
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                PropertyAnimation {
                    property: "color"
                    duration: 1000
                }
            }
        ]

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                switch(parent.state) {
                case "red_light":
                    console.log("current time = " + DateUtil.getDateMilliseconds()+ "last time = " + lastTime.lastTime);
                    if(DateUtil.getDateMilliseconds() - lastTime.lastTime >= 5000) {
                        lastTime.lastTime = DateUtil.getDateMilliseconds();
                        lastTime.fromRed = true;
                        parent.state = "yellow_light";
                    }
                    break;
                case "yellow_light":
                    if(DateUtil.getDateMilliseconds() - lastTime.lastTime >= 3000) {
                        lastTime.lastTime = DateUtil.getDateMilliseconds();
                        if(lastTime.fromRed == true) {
                            parent.state = "green_light"
                        } else {
                            parent.state = "red_light"
                        }
                    }
                    break;
                case "green_light":
                    if(DateUtil.getDateMilliseconds() - lastTime.lastTime >= 5000) {
                        lastTime.lastTime = DateUtil.getDateMilliseconds();
                        lastTime.fromRed = false;
                        parent.state = "yellow_light";
                    }
                    break;
                }
            }
        }

        Item {
            id: lastTime
            property var lastTime: DateUtil.getDateMilliseconds()
            property bool fromRed: true
        }
    }
}
