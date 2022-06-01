import QtQuick

FocusScope{

    ListModel {
        id: camera_model
        ListElement {
            name: "Camera Delay"
            path: "settings_sub_cameradelay.qml"
        }
        ListElement {
            name: "Set Duration"
            path: "settings_sub_duration.qml"
        }
        ListElement {
            name: "Park Assistance"
            path: "settings_sub_parkassistance.qml"
        }
    }

    CompListview{
        model: camera_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

