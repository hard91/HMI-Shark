import QtQuick 2.0
//import QtGraphicalEffects 1.0

Rectangle {
    implicitWidth: 180
    implicitHeight: 300
    radius: 10

    Image{
        id: bag_nav
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/res/img/nav_backg.png"
    }
//    GaussianBlur {
//            anchors.fill: bag_nav
//            source: bag_nav
//            radius: 8
//            samples: 16
//        }
    Text{
        id: top
        text: "Map"
        color: "#F0F7F4"
        font.bold: true;
        font.pointSize: 20
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
