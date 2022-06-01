import QtQuick 2.0
import com.settings 1.0
import QtQuick.Layouts

FocusScope{
    focus: true  // This is must in order to get focus after qml loaded in loader
    // This will be forwarded to any component which is having true. Hence, it should set only in one component

    MainSettingsModel{
        id: cpp_MainSettingsModel
    }

    Text{
        id: id_app
        text: "Settings"
        color: "#F05D5E"
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true;
        font.pointSize: 20
    }
    Row{
        id: main_row
        anchors.top: id_app.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        CompSettingsLeftList{
            id: id_left
            focus: true  // This Component will only get focus
            height: parent.height
            width: 200
            onLoad_pathChanged: {
                console.log("setting path to open",id_left.load_path)
                id_right.set_source = id_left.load_path
            }
        }
        CompSettingsRightList{
            id: id_right
            height: parent.height
            width: 380
        }
    }

}
