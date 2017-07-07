import QtQuick 2.0
import QtQml.Models 2.1

ListView{
    id: root
    width: 500
    height: 500
    model: pageViewModel

    property ObjectModel pageViewModel: pageViewModel
    ObjectModel {
        id: pageViewModel
    }

    // 横向、只显示一个
    orientation: ListView.Horizontal
    snapMode: ListView.SnapOneItem
    highlightRangeMode: ListView.StrictlyEnforceRange
    cacheBuffer: 3
    boundsBehavior: Flickable.StopAtBounds

    // 当前页指示器
    PageViewIndicator{
        target : root
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        z: 2
    }
}
