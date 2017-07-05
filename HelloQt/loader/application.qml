import QtQuick 2.0

Item {

    width: 100; height: 100

    Loader {
        id: myLoader
        source: "MyItem.qml"
    }

    Connections {
        target: myLoader.item
        onHello: console.log(msg)
    }
}
