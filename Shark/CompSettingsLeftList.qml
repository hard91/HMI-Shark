import QtQuick 2.0
import QtQuick.Layouts
FocusScope{
    id: left_list
    implicitHeight: 400
    implicitWidth: 200
    property string load_path: ""

    Rectangle{
        id: idLeftPanel
        anchors.fill: parent
        radius: 15
        color: "#2B4162"

        ListView
        {
            id: id_list
            anchors.fill: parent
            anchors.margins: 10
            clip: true
            focus: true  // otherwise list will not get focus

            snapMode: ListView.SnapToItem // automatically snap to the item
            highlightRangeMode: ListView.StrictlyEnforceRange // List view stick to 1st index
            boundsBehavior: Flickable.StopAtBounds // it will not overshoot the flickable
            model: cpp_MainSettingsModel

            currentIndex : 0  //-1 set to null otherwise always 1st item will be selected
            highlight: Rectangle{
                radius: 5
                z: 5
                color: "transparent"
                border.color: "#FFFCF7"
                border.width : 3
                //opacity: .45
            }

            footer: Text{
                text: "~~~~~~~ Count: " + id_list.count + " ~~~~~~~~"
                color: "#F3D8C7"
            }
            // This will map keyevent or mouseclick(when this happened : id_list.currentIndex = index) with qml path
            onCurrentItemChanged: {
                left_list.load_path = model.getPath(id_list.currentIndex)
            }
            delegate: Item{
                width: ListView.view.width  // Always use it otherwise you will get error: TypeError: Cannot read property 'width' of null
                height: 52
                Row {
                    id: id_delegate
                    anchors.fill: parent
                    spacing: 5
                    Image {
                        width: 48
                        height: 48
                        source: model.qml_icon
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: model.qml_isMore ? model.qml_longName + ">" : model.qml_longName
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        color: "#FA9F42"
                        wrapMode: Text.WrapAnywhere
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        id_list.currentIndex = index

                        //                        console.log("Clicked on : "+ index + " count : "+ id_list.count + " Load qml : " + model.qml_path)
                    }
                }
            }
        }
    }

}



