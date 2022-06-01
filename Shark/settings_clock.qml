import QtQuick

FocusScope{

    ListModel {
        id: clock_model
        ListElement {
            name: "Set Time"
            path: "settings_sub_settime.qml"
        }
        ListElement {
            name: "Set Date"
            path: "settings_sub_setdate.qml"
        }
        ListElement {
            name: "GPS Sync"
            path: "settings_sub_gpssync.qml"
        }
    }

    CompListview{
        model: clock_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

