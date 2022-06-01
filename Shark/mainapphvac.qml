import QtQuick 2.0

FocusScope{
    focus: true
    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 100
        color: "red"
        opacity: .5
        Text{
            anchors.centerIn: parent
            text: "TBD: Main HVAC Page"
        }
        focus: true
            Keys.onPressed: (event)=>{
                    console.log("Pressed Key: ", event.key);
                    event.accepted = true;
            }
    }
}
