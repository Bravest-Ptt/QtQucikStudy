import QtQuick 2.0

Grid {
    columns: 2
    spacing: 2
    Row {
        spacing: 2
        Rectangle { color: "red"; width: 100; height: 50 }
        Rectangle { color: "green"; width: 100; height: 50 }
    }
    Column {
        spacing: 2
        Rectangle { color: "blue"; width: 100; height: 50 }
        Rectangle { color: "magenta"; width: 100; height: 50 }
    }

    Rectangle {
        width: 100;
        height:100
        color: "cyan"
    }
}
