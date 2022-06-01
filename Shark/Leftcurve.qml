import QtQuick 2.0

Rectangle{
    width: 30
    height: 30
    color: "black"
    Rectangle{
        anchors.fill: parent
        radius: width/2
        color: "white"
        Rectangle{
            color: "white"
            width: parent.width
            height: parent.height/2
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }
        Rectangle{
            color: "white"
            width: parent.width/2
            height: parent.height/2
            anchors.top: parent.top
             anchors.left: parent.left
        }
    }
}
