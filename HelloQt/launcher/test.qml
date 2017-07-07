import QtQuick 2.0
import QtQuick.Window 2.0
import AppListModel 1.0
import "DateUtils.js" as DateUtils

Window {
    id: window
    visible: true
    width: 350
    height: 600
    title: "PTLauncher"
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    AppListModel {
        id:gridData
        source: "/home/thundersoft/pengtian/projects/QtQucikStudy/HelloQt/qml/xml_data.xml"
    }

    Rectangle {
        id: root

        property Rectangle detailPage: detailPage

        width: window.width
        height: window.height
        Image {
            id: backgound
            width: root.width
            height: root.height
            source: "qrc:/picture/background/universal.jpg"
        }

        Column {
            id: content
            width: root.width
            height: root.height

            Text {
                id: time
                width: parent.width
                height: parent.height / 6
                color: "#FFFFFF"
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter

                Component.onCompleted: {
                    var date = new Date();
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    time.text = hours + ":" + minutes;
                }
            }

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: time.text = Date("yy-mm-hh").toString()
            }

            PageView {
                id: pageView
                width: content.width
                height: content.height / 6 * 4
                anchors.centerIn: parent
            }

            Row {
                id: row
                width: content.width

                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    bottomMargin: 10
                    leftMargin: 10
                    rightMargin: 10
                    horizontalCenter: content.horizontalCenter
                }

                spacing: 10
                Repeater {
                    id: appFrequently
                    model: [
                        "qrc:/picture/icons/Phone.png",
                        "qrc:/picture/icons/Sms.png",
                        "qrc:/picture/icons/Contacts.png",
                        "qrc:/picture/icons/chrome.png"
                    ]
                    Image {
                        id: repeaterItem
                        width: (content.width
                                - row.spacing * appFrequently.model.length
                                - row.anchors.leftMargin
                                - row.anchors.rightMargin) / 4
                        height: width
                        source: modelData
                    }
                }
            }

            Component.onCompleted: {
                var time = DateUtils.getDateMilliseconds();

                var PAGE_CHILD_NUMBER = 16;

                var totalCount = gridData.rowCount();
                console.log("row Count = " + totalCount);

                var pageNumber = totalCount / PAGE_CHILD_NUMBER;
                //float to int
                pageNumber = Math.ceil(pageNumber);

                var endNumber = totalCount % PAGE_CHILD_NUMBER;

                console.log("end number = " + endNumber);
                console.log("pageNumber :" + pageNumber);

                for (var i = 0; i < pageNumber; i++) {
                    var pageContent = creator.createObject();
                    pageContent.root = root;
                    pageView.pageViewModel.append(pageContent);

                    var isEnd =  (pageNumber - 1 == i);
                    var loopNumber = isEnd
                            ? (i * PAGE_CHILD_NUMBER + endNumber)
                            : (i + 1) * PAGE_CHILD_NUMBER;

                    console.log("loopNumber = " + loopNumber);


                    for (var j = i * 16; j < loopNumber; j++) {
                        var dataItem = gridData.get(j);
                        pageContent.pageModel.append(dataItem);
                    }
                    console.log(pageContent.pageModel.count);
                }
                console.log(DateUtils.getDateMilliseconds() - time);
            }
        }

        state: "home"
        states: [
            State {
                name: "home"
                PropertyChanges {
                    target: detailPage
                    visibleInner: false;
                    width: 0
                    height: 0
                }
            },
            State {
                name: "detail"
                PropertyChanges {
                    target: detailPage
                    visibleInner: true;
                    width: parent.width
                    height: parent.height
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                reversible: true
                PropertyAnimation {
                    property: "width"
                    duration: 250
                }
                PropertyAnimation {
                    property: "height"
                    duration: 250
                }
            }
        ]


        Rectangle{
            id:detailPage
            property string name;
            property Image icon;
            property bool visibleInner: false

            anchors.centerIn: parent
            color: "#000000"

            MouseArea {
                anchors.fill: parent
                onClicked: root.state = "home"
            }

            Column {
                visible: detailPage.visibleInner
                spacing: 5
                anchors.centerIn: parent
                Image {
                    id: icon
                    source: detailPage.icon.source
                    width: detailPage.icon.width
                    height: width
                    anchors.centerIn: parent.Center
                }
                Text {
                    id: name
                    text: detailPage.name
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#FFFFFF"
                }
            }
        }
    }

    Component {
        id: creator
        Page {
            id:page
            width: pageView.width
            height: pageView.height
            cellWidth: pageView.width / 4;
            cellHeight: pageView.width / 4;
        }
    }
}
