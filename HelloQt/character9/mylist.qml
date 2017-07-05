import QtQuick 2.0

Rectangle {
    width: 180;
    height: 200
    color: "green"
    Component {
        id: delegate
        Item {
            id: wrapper
            width: 180; height: 40;
            Column {
                x: 5; y: 5
                Text { text: '<b>Name:</b>' + name }
                Text { text: '<b>Number:</b>' + number }
            }
        }
    }

    Component {
        id:highlight
        Rectangle {
            color: "lightsteelblue"
            radius: 5
        }
    }

//    ListView {
//        width: parent.width; height: parent.height
//        model: MyModel{}
//        delegate: delegate
//        highlight: highlight
//        focus: true
//    }

    GridView {
        width: parent.width; height: parent.height
        model: MyModel{}
        delegate: delegate
        highlight: highlight
        cellHeight: 80; cellWidth: 80
        focus: true
    }
}
