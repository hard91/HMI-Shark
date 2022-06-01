import QtQuick 2.0
//import QtGraphicalEffects 1.0

Rectangle {
    implicitWidth: 180
    implicitHeight: 300

    Image{
        id: bag_media
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/res/img/media_backg.jpg"
    }
    MouseArea{
        id: id_tileMedia
        anchors.fill: parent
        onClicked: {
            activateApp("music",2)
        }
    }

//    GaussianBlur {
//        anchors.fill: bag_media
//        source: bag_media
//        radius: 8
//        samples: 16
//    }
    Text{
        id: top
        text: "Media"
        color: "#F0F7F4"
        font.bold: true;
        font.pointSize: 20
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Row{
        id: controls
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        Image{
            height: 50; width: 50
            fillMode: Image.Stretch
            source: "qrc:/res/img/media_controls/goto_start.png"
        }
        Image{
            height: 50; width: 50
            fillMode: Image.Stretch
            source: "qrc:/res/img/media_controls/play.png"
            MouseArea{
                onClicked: {

                }
            }
        }
        Image{
            height: 50; width: 50
            fillMode: Image.Stretch
            source: "qrc:/res/img/media_controls/goto_end.png"
        }
    }
}
