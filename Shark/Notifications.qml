import QtQuick 2.0

Rectangle {
    id: idnotfarea
    width: 600
    state: "INIT"

    Image{
        source: "/res/img/linehorizontal.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10
    }
    property real __swipeY: 0

    MouseArea{
        anchors.fill: parent
        onPressed:(mouse)=>{
            idnotif.__swipeY = mouse.y
        }
        onReleased: (mouse)=>{

            //var minSwipeDistance = 100
            if(idnotif.__swipeY > mouse.y){
                idnotif.state = "CLOSED"
            }
        }
    }
    states: [
        State {
            name: "INIT"
            PropertyChanges { target: idnotfarea; y: -idnotfarea.height}

        },
        State {
            name: "OPENED"
            //  PropertyChanges { target: idnotfarea; visible: true}
        }
    ]
    transitions: [
        Transition {
            from: "*"//"PRESSED"
            to: "CLOSED"
            NumberAnimation { target: idnotfarea; property: "y"; to: -idnotfarea.height; duration: 1000; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: idnotfarea; property: "color"; from: "ffe8d6"; to: "white";duration: 1000; }
            PropertyAnimation { target: idnotfarea; property: "opacity"; to: 0;duration: 1000; }
        },
        Transition {
            from: "*"//"RELEASED"
            to: "OPENED"
            NumberAnimation { target: idnotfarea; property: "y"; to: 0;duration: 500; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: idnotfarea; property: "color"; from: "white"; to: "black";duration: 500; }
            PropertyAnimation { target: idnotfarea; property: "opacity"; to: .8;duration: 500; }
        }
    ]
}
