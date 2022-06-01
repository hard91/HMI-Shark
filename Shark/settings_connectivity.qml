import QtQuick

FocusScope{

    ListModel {
        id: connectivity_model
        ListElement {
            name: "Bluetooth"
            path: "settings_sub_bluetooth.qml"
        }
        ListElement {
            name: "WiFi"
            path: "settings_sub_wifi.qml"
        }
        ListElement {
            name: "GPS"
            path: "settings_sub_gps.qml"
        }
    }

    CompListview{
        model: connectivity_model

        onPathchanged: {
            mystackview.push(load_path)
        }

        onBackButtonPressed: {
            mystackview.pop()
        }

    }
}

