import QtQuick 2.0

//Item {
//    focus: true
//    Keys.onPressed: {
//        if (event.key == Qt.Key_Left) {
//            console.log("move left");
//            event.accepted = true;
//        }
//    }
//}
Item {
    focus: true
    Keys.onLeftPressed: {
        console.log("move llleft");
    }
}
