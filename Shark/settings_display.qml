import QtQuick

FocusScope{

    ListModel {
        id: display_model
        ListElement {
            name: "Display Brightness"
            path: "settings_sub_brightness.qml"
        }
        ListElement {
            name: "Day & Night Mode"
            path: "settings_sub_daynightmode.qml"
        }
    }

    CompListview{
        model: display_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

