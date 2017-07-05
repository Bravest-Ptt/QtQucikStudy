import QtQuick 2.0

Rectangle {
    width: 150
    height: 250
    Rectangle {
        id: stop_light
        x: 25
        y: 25
        width: 100
        height: 100
        states:[
            State {
                name: "stop"
                PropertyChanges {
                    target: stop_light
                    color: "red"
                }
                PropertyChanges {
                    target: go_light
                    color: "black"
                }
            },
            State {
                name: "go"
                PropertyChanges {
                    target: stop_light
                    color: "black"
                }
                PropertyChanges {
                    target: go_light
                    color:"green"
                }
            }
        ]
        state: "stop"
        MouseArea {
            anchors.fill: parent
            onClicked: parent.state == "stop" ? parent.state = "go" : parent.state = "stop"
        }

        transitions: [
            Transition {
                from: "stop"; to: "go"
                PropertyAnimation {
                    target: stop_light
                    properties: "color"; duration: 1000
                }
            },
            Transition {
                from: "go"; to: "stop"
                PropertyAnimation {
                    target: go_light
                    properties: "color"; duration: 1000
                }
            }
        ]
    }
    Rectangle {
        id: go_light
        x: 25
        y: 135
        width: 100
        height: 100
        MouseArea {
            anchors.fill: parent
            onClicked: stop_light.state == "stop" ? stop_light.state = "go" : stop_light.state = "stop"
        }
    }
}
