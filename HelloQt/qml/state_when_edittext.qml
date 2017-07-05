import QtQuick 2.0

Rectangle {
    width: 250
    height: 50
    color: "#ccffcc"
    TextInput {
        id: text_field
        text: "Enter text..."
        width: 200
        height: parent.height
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 2
        anchors.topMargin: 2
    }
    Image {
        id: clear_button
        width:40
        height: 40
        x: 200
        source: "http://pic2.cxtuku.com/00/13/26/b83155d326bb.jpg"
        MouseArea {
            anchors.fill: parent
            onClicked: text_field.text = ""
            onPressed: parent.opacity = 0.6
            onReleased: parent.opacity = 1
        }
    }
    states: [
        State {
            name: "with_text"
            when: text_field.text != ""
            PropertyChanges {
                target: clear_button
                opacity: 1.0
            }
        },
        State {
            name: "without_text"
            when: text_field.text == ""
            PropertyChanges {
                target: clear_button
                opacity: 0.25
            }
            PropertyChanges {
                target: text_field
                focus: true
            }
        }
    ]
    transitions: [
        Transition {
            from: "with_text"
            to: "without_text"
            reversible: true
            PropertyAnimation {
                target: clear_button
                properties: "opacity"
                duration: 1000
            }
        }
    ]
}
