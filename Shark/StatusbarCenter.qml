import QtQuick

FocusScope{
    id: id_center
    Item {
        id: clock
        anchors.fill: parent
        Rectangle
        {
            id: id_clock
            height: 30
            width: parent.width
            radius: parent.height/2
            color: "#F05D5E"
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: timeText
                text: Qt.formatTime(new Date(),"h:m:s AP")
                color: "white"
                anchors.centerIn: parent
                //font.bold: true;
                font.pointSize: 15
            }
            Timer {
                id: timer
                interval: 1000
                repeat: true
                running: true

                onTriggered:
                {
                    timeText.text =  Qt.formatTime(new Date(),"h:m:s AP")
                }
            }
        }
        MouseArea{
            anchors.fill: id_clock
            onClicked: {
                activateApp("settings",5)
            }
        }
    }
    Rectangle{
        anchors.fill: id_center
        color: "yellow"
        opacity: .5
        visible: false
    }
}
