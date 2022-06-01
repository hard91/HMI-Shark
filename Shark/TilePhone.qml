import QtQuick 2.0
//import QtGraphicalEffects 1.15

Rectangle {
    implicitWidth: 180
    implicitHeight: 300
    radius: 10

    Image{
        id: bag_nav
        anchors.fill: parent
        fillMode: Image.Stretch
        source: "qrc:/res/img/phone_backg.jpg"
    }
//    GaussianBlur {
//            anchors.fill: bag_nav
//            source: bag_nav
//            radius: 8
//            samples: 16
//        }
    Text{
        id: top
        text: "Phone"
        color: "#F0F7F4"
        font.bold: true;
        font.pointSize: 20
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
