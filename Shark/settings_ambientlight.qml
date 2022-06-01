import QtQuick

FocusScope{

    ListModel {
        id: cambient_model
        ListElement {
            name: "Ambient Light"
            path: "settings_sub_amblight.qml"
        }
        ListElement {
            name: "Set Color"
            path: "settings_sub_setcolor.qml"
        }
    }

    CompListview{
        model: cambient_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

