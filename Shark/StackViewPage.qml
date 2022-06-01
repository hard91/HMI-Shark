import QtQuick 2.0
import QtQuick.Controls 2.12

//////////////////////////////////////////////////////////////
// Any qml loaded via StackView can use its id mystackview for push and pop
// but if you want to use StackView outside then use mystack
/////////////////////////////////////////////////////////////
Item {
    //anchors.fill: parent
    property alias mystack: mystackview
    StackView {
        id: mystackview
        anchors.fill: parent
//        initialItem: ""

        pushEnter: Transition {
               PropertyAnimation {
                   property: "opacity"
                   from: 0
                   to:1
                   duration: 200
               }
           }
        pushExit: Transition {
               PropertyAnimation {
                   property: "opacity"
                   from: 1
                   to:0
                   duration: 200
               }
           }
        popEnter: Transition {
               PropertyAnimation {
                   property: "opacity"
                   from: 0
                   to:1
                   duration: 200
               }
           }
        popExit: Transition {
               PropertyAnimation {
                   property: "opacity"
                   from: 1
                   to:0
                   duration: 200
               }
           }
    }

}
