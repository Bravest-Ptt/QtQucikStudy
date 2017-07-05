import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Rectangle {
    width: 100
    height: 100

    XmlListModel {
        id: model
        // XmlRole queries will be made on <book> elements
        query: "/hello/book"
        xml: Qt.resolvedUrl("xml_data.xml")

        // query the book title
        XmlRole { name: "title"; query: "title/string()" }

        // query the book's year
        XmlRole { name: "year"; query: "year/number()" }

        // query the book's type (the '@' indicates 'type' is an attribute, not an element)
        XmlRole { name: "type"; query: "@type/string()" }

        // query the book's first listed author (note in XPath the first index is 1, not 0)
        XmlRole { name: "first_author"; query: "author[1]/string()" }

        // query the wanted attribute as a boolean
        XmlRole { name: "wanted"; query: "boolean(@wanted)" }
        Component.onCompleted: {
            console.log(xml.toString());
        }
    }

    Component.onCompleted: {
        console.log("count = " + model.count);
        for (var i = 0; i < model.count; i++) {
            console.log("title = " + model.get(i).title);
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: console.log("count = " + model.count + ", error = " + model.errorString());
    }
}
