import QtQuick

FocusScope{

    ListModel {
        id: car_model
        ListElement {
            name: "Tire Pressure"
            path: "settings_sub_tirepressure.qml"
        }
        ListElement {
            name: "Oil Life"
            path: "settings_sub_oil.qml"
        }
    }

    CompListview{
        model: car_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

