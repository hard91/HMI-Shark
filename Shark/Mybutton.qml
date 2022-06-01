import QtQuick 2.0

Rectangle {
    id: button
    width: 48
    height: 48
    property alias btnimg: idimg.source
    property alias btntext: idtext
    property alias btn: idbr

    signal buttonPressed()
    signal buttonRelease()
    property bool selected: false

    Rectangle{
        id: idbr

        color: "white"
        width: 60
        height: 60
        radius: width/2

        Image{
            id : idimg
            fillMode: Image.PreserveAspectCrop
            anchors.horizontalCenter: parent.horizontalCenter
            //source: "/res/img/home.png"
        }
        MouseArea {
            anchors.fill: parent

            onPressed:{
            buttonPressed();
            }

            onReleased: {
            buttonRelease();

            }
        }
    }

    Leftcurve{
        id: idleftc
        visible: false
        anchors.left: idbr.left
        anchors.bottom: idbr.bottom
        anchors.leftMargin: -26
    }
    Rightcurve{
        id: idrightc
        visible: false
        anchors.right: idbr.right
        anchors.bottom: idbr.bottom
        anchors.rightMargin: -26
    }

    Text{
        id: idtext
        visible: false
        anchors.top: idbr.bottom
        anchors.horizontalCenter: idbr.horizontalCenter
        anchors.topMargin: 8
        text: "default"
    }

    state: "NORMAL"
    states: [
        State {
            when: !selected
            name: "NORMAL"
            PropertyChanges { target: idtext; visible: false}
        },
        State {
            name: "PRESSED"
            //PropertyChanges { target: idtext; visible: true}
        },
        State {
            name: "RELEASED"
            //PropertyChanges { target: idtext; visible: false}
        },
        State {
            when: selected
            name: "SELECTED"
            PropertyChanges { target: idtext; visible: true}
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "NORMAL"
            NumberAnimation { target: idbr; property: "y"; from: -30; to: 0;duration: 100; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: idbr; property: "color"; from: "black"; to: "white";duration: 100; }
            PropertyAnimation { target: idleftc; property: "visible"; to: false;duration: 10; }
            PropertyAnimation { target: idrightc; property: "visible"; to: false;duration: 10; }
        },
        Transition {
            from: "*"
            to: "SELECTED"
            NumberAnimation { target: idbr; property: "y"; from: 0; to: -30;duration: 100; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: idbr; property: "color"; from: "white"; to: "black";duration: 100; }
            PropertyAnimation { target: idleftc; property: "visible"; to: true;duration: 100; }
            PropertyAnimation { target: idrightc; property: "visible"; to: true;duration: 100; }

        }
    ]
}
