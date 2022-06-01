import QtQuick 2.0
import QtMultimedia

FocusScope{
    id: root
    focus: true
    implicitHeight: 330
    implicitWidth: 600

    MediaPlayer {
        id: mymediaPlayer
        audioOutput: AudioOutput {
            volume: 5
        }
        onMetaDataChanged: {
            read(mymediaPlayer.metaData);
        }

    }

    function read(metadata) {
        if (metadata) {
            for (var key of metadata.keys()) {
                if (metadata.stringValue(key)) {
                    console.log(metadata.metaDataKeyToString(key),metadata.stringValue(key));
                }
            }
        }
    }

    Text{
        id: id_app
        text: "Media"
        color: "#E67E22"
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true;
        font.pointSize: 20
    }
    CompMetadata{
        id: id_metadata
        anchors.top: id_app.bottom
        anchors.bottom: id_progressbar.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 20
    }

    CompProgressBar{
        id: id_progressbar
        anchors.bottom: id_controls.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: 20
    }

    CompMediaControls{
        id: id_controls
        height: 50
        width: parent.width
        anchors.bottom: root.bottom
        anchors.bottomMargin: 20
        focus: true
    }
}
