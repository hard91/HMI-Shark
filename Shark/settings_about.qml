import QtQuick 2.0

FocusScope{


Column
{
    width: parent.width
    Image {
        id: id_photo
        source: "qrc:/res/assets/media_assets/browser.png"

    }
    Text {
        id: name
        width: parent.width
        wrapMode: Text.WrapAnywhere
        text: qsTr("Hi, My name is Hardeep Singh. I am HMI developer and I love to code. This Project is just for fun. Even I am trying this text for my testing lol.....")
    }
}
}
