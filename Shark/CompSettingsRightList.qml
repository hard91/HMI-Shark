import QtQuick 2.0
import QtQuick.Controls

FocusScope{
    id: right_list
    implicitHeight: 100
    implicitWidth: 380
    property string set_source: "empty set"

    Rectangle{
        id: idRightPanel
        width: 380
        height: parent.height
        radius: 15
        color: "#FA9F42"
    }
//    Loader{
//        id: right_loader
//        anchors.fill: parent
//        source: set_source
//    }
    StackViewPage{
        id: id_stack
        anchors.fill: idRightPanel
    }
    onSet_sourceChanged: {
        console.log("My stack depth is:", id_stack.mystack.depth)
        id_stack.mystack.clear(StackView.Immediate) // bec when left list change then we need to clear stack
        id_stack.mystack.push(set_source)
    }


}
