import QtQuick

FocusScope{

    ListModel {
        id: voice_model
        ListElement {
            name: "Voice Recongnization"
            path: "settings_sub_vr.qml"
        }
        ListElement {
            name: "Select Language"
            path: "settings_sub_vrlang.qml"
        }
        ListElement {
            name: "Select Voice"
            path: "settings_sub_vrvoice.qml"
        }
    }

    CompListview{
        model: voice_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

