import QtQuick

FocusScope{

    ListModel {
        id: sound_model
        ListElement {
            name: "Balance & Fade"
            path: "settings_sub_balancefade.qml"
        }
        ListElement {
            name: "Equalizer"
            path: "settings_sub_equalizer.qml"
        }
        ListElement {
            name: "Loudness"
            path: "settings_sub_loudness.qml"
        }
    }

    CompListview{
        model: sound_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

