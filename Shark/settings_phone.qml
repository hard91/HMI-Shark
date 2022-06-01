import QtQuick

FocusScope{

    ListModel {
        id: phone_model
        ListElement {
            name: "Bluetooth"
            path: "settings_sub_contacts.qml"
        }
        ListElement {
            name: "Manage Contacts"
            path: "settings_sub_managecontacts.qml"
        }
    }

    CompListview{
        model: phone_model
        onLoad_pathChanged: {
            console.log(load_path)
        }
    }
}

