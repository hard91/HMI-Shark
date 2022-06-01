import QtQuick 2.3
import QtQuick.Controls 2.0
import com.hmi 1.0

Rectangle {
    id: idwin
    visible: true
    width: 640
    height: 480
    color: "black"
    signal activateApp(string app, int index)

    Component.onCompleted: {
        activateApp("home",0)
    }

    onActivateApp: (app,index)=>{
        idappbar.applicationbar.currentIndex = index
        switch(app){
        case "home":
        {
            idapp.appLoader.source = "qrc:/mainapphome.qml"
            break;
        }
        case "menu":
        {
            idapp.appLoader.source = "qrc:/mainappdrawer.qml"
            break;
        }
        case "music":
        {
            idapp.appLoader.source = "qrc:/mainappmusic.qml"
            break;
        }
        case "radio":
        {
            idapp.appLoader.source = "qrc:/mainappradio.qml"
            break;
        }
        case "hvac":
        {
            idapp.appLoader.source = "qrc:/mainapphvac.qml"
            break;
        }
        case "settings":
        {
            idapp.appLoader.source = "qrc:/mainappsettings.qml"
            break;
        }
        default:
            idapp.appLoader.source = ""

        }

        cpp_AppsDrawer.appLauncher(app);

    }

    AppsDrawer{
        id: cpp_AppsDrawer
    }

    Statusbar{
        id: idsts
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        onOpenNotification: {
            if(idnotif.state === "CLOSED" || idnotif.state === "INIT" ){
                idnotif.state = "OPENED"
            }
        }
    }

    Apparea{
        id: idapp
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: idsts.bottom
        anchors.bottom: idappbar.top
        anchors.topMargin: 10
        anchors.bottomMargin: 10
    }

    Appbar{
        id: idappbar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Notifications{
        id: idnotif
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
