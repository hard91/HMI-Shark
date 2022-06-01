import QtQuick 2.0

FocusScope{
    id: progress_bar
    implicitHeight: 10
    implicitWidth: 580
    property int percent : Math.floor((mymediaPlayer.position* 100) / mymediaPlayer.duration)

    Row {
        id: id_back_progress
        spacing: 5
        x: spacing
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Repeater {
            model: 20
            Rectangle {
                id: inner
                width: 20
                height: 10
                color: "#CCAD8F"
                radius: height/2
            }
        }
    }
    MouseArea{
        id: id_mouse
        anchors.fill: id_back_progress
        enabled: mymediaPlayer.seekable
        onClicked: (mouse)=> {
        mymediaPlayer.setPosition(mouse.x/500  * mymediaPlayer.duration);
        }
        onMouseYChanged: (mouse)=> {
        mymediaPlayer.setPosition(mouse.x/500 * mymediaPlayer.duration);
        }
    }

    Rectangle {
        id: progress
        height: 10
        radius: height/2
        color: "#E67E22"
        anchors.left: id_back_progress.left
        anchors.verticalCenter: parent.verticalCenter
        width: percent/100 * 500
    }

    Text{
        id: id_duration
        color: "#E67E22"
        font.bold: true
        anchors.bottom: progress_bar.bottom
        anchors.bottomMargin: 15
        anchors.right: progress_bar.right
        anchors.rightMargin: 50
        text: {
            var m = Math.floor(mymediaPlayer.position / 60000)
            var ms = (mymediaPlayer.position / 1000 - m * 60).toFixed(2)
            var m_duration = Math.floor(mymediaPlayer.duration / 60000)
            var ms_duration = (mymediaPlayer.duration / 1000 - m_duration * 60).toFixed(2)// toFixed means after . how many digit

            return `${m}:${ms.padStart(5, 0)} / ${m_duration}:${ms_duration.padStart(5, 0)}`
            // padstart means it will fill 0 before no until total 5 digit inculing (.)
        }
    }
}
