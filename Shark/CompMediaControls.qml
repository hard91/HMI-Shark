import QtQuick 2.0
import QtMultimedia
import QtQuick.Dialogs

FocusScope{
    id: id_controls
    property bool isFav: false
    property bool isPlaying: mymediaPlayer.playbackState === MediaPlayer.PlayingState
    property bool isStopped: mymediaPlayer.playbackState === MediaPlayer.StoppedState
    property bool isPlayable: mymediaPlayer.mediaStatus  !== MediaPlayer.NoMedia
    focus: true

    // why it is not getting focus even focus set to true here and in mainsettings qml bec
    // CompMetadata got focus first and inside it it set focus: true
    Keys.onPressed: (event)=>{
                        if (event.key === Qt.Key_Left) {
                            console.log("move left");

                            event.accepted = true;
                        }
                    }

    Row{
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        Image{
            id: id_browser
            source: "qrc:/res/assets/media_assets/browser.png"
            FileDialog {
                id: fileDialog
                title: "Please select a Song to play..."
                onAccepted: {
                    mymediaPlayer.stop()
                    mymediaPlayer.source = fileDialog.currentFile
                }
            }
            MouseArea{
                id: id_mousefolder
                anchors.fill: parent

                onClicked: {
                    fileDialog.open()
                }
            }

        }
        Image{
            id: id_fr
            source: isPlayable ? "qrc:/res/assets/media_assets/fr.png" : "qrc:/res/assets/media_assets/fr_disable.png"
            MouseArea{
                id: id_mousefr
                anchors.fill: parent
                enabled: mymediaPlayer.seekable
                onClicked: {
                    if(mymediaPlayer.position > 10000)
                        mymediaPlayer.setPosition(mymediaPlayer.position - 10000);
                }
            }
        }
        Image{
            id: id_previous
            source:  isPlayable ? "qrc:/res/assets/media_assets/previous.png" : "qrc:/res/assets/media_assets/previous_disable.png"
            MouseArea{
                id: id_mousePrevious
                anchors.fill: parent
                onClicked: {  }
            }
        }
        Image{
            id: id_play
            source:{
                if(!isPlayable){
                    return  "qrc:/res/assets/media_assets/play_disable.png"
                }
                if(isPlaying && !isStopped){
                    return "qrc:/res/assets/media_assets/pause.png"
                } else {
                    return "qrc:/res/assets/media_assets/play.png"
                }
            }

            MouseArea{
                id: id_mousePlayPause
                anchors.fill: parent

                onClicked: {
                    if(isPlaying === false){
                        mymediaPlayer.play()
                    } else {
                        mymediaPlayer.pause()
                    }
                }
            }
        }
        Image{
            id: id_next
            source:  isPlayable ? "qrc:/res/assets/media_assets/next.png" : "qrc:/res/assets/media_assets/next_disable.png"
            MouseArea{
                id: id_mouseNext
                anchors.fill: parent
                onClicked: {
                    //mymediaPlayer.
                }
            }
        }
        Image{
            id: id_ff
            source: isPlayable ? "qrc:/res/assets/media_assets/ff.png" : "qrc:/res/assets/media_assets/ff_disable.png"
            MouseArea{
                id: id_mouseff
                anchors.fill: parent
                enabled: mymediaPlayer.seekable
                onClicked: {
                    if((mymediaPlayer.duration - mymediaPlayer.position) > 10000)
                        mymediaPlayer.setPosition(mymediaPlayer.position + 10000);
                }
            }
        }
        Image{
            id: id_fav
            source: {
                if(!isPlayable){
                    return  "qrc:/res/assets/media_assets/fav_disable.png"
                }
                if(isFav){

                    return "qrc:/res/assets/media_assets/fav.png"
                } else {

                    return "qrc:/res/assets/media_assets/unfav.png"
                }
            }

            MouseArea{
                id: id_mouseFav
                anchors.fill: parent
                onClicked: { isFav = !isFav }
            }
        }
    }
}
