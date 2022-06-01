import QtQuick

FocusScope{

    ListModel {
        id: general_model
        ListElement {
            name: "Units"
            path: "settings_sub_units.qml"
        }
        ListElement {
            name: "Restore To Default"
            path: "settings_sub_restore.qml"
        }
        ListElement {
            name: "Touch Tone Beep"
            path: "settings_sub_touchbeep.qml"
        }
    }

    CompListview{
        model: general_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

