import QtQuick 2.0

Rectangle {
    id: root
    width: 600
    height: 40
    radius: height/2
    color: "white"
    signal openNotification();

    MouseArea{
        anchors.fill: parent

        onClicked: (mouse)=>{
                       mouse.accepted = true;
                       openNotification()
                   }
    }

    StatusbarLeft{
        id: left
        height: parent.height
        anchors.right: center.left
        anchors.left: parent.left
        clip: true
    }
    StatusbarCenter{
        id: center
        height: parent.height
        width: 120
        clip: true
        anchors.horizontalCenter: root.horizontalCenter
    }
    StatusbarRight{
        id: right
        height: parent.height
        anchors.left: center.right
        anchors.right: parent.right
        clip: true
    }
}

