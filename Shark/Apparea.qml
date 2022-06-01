import QtQuick 2.0

Rectangle {
    height: 330
    width: 600
    radius: 10
    color: "lightgrey"
    property alias appLoader: id_mainArea

    Loader{
        id: id_mainArea
        anchors.fill: parent

        onSourceChanged: {
            console.log("setting foucs >>>>>>")
            id_mainArea.forceActiveFocus() // This is very important otherwise loaded qml will not get focus.
        }
    }



}
