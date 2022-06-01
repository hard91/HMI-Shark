import QtQuick

Item {
    anchors.fill: parent
    property alias model: id_list.model  // To set it from main page
    property string load_path: ""
    signal backButtonPressed()
    signal pathchanged()

    ListView {
        id: id_list
        anchors.fill: parent
        anchors.margins: 10
        clip: true
        focus: true  // otherwise list will not get focus
        currentIndex : -1
        snapMode: ListView.SnapToItem // automatically snap to the item
        //highlightRangeMode: ListView.StrictlyEnforceRange // List view stick to 1st index
        boundsBehavior: Flickable.StopAtBounds // it will not overshoot the flickable

        // This will map keyevent or mouseclick(when this happened : id_list.currentIndex = index) with qml path
        // Why commented because on keyevent up and down it will load the qml
        // here we only want to load file on click
//        onCurrentItemChanged: {
//            load_path =  model.get(id_list.currentIndex).path
//        }
        delegate: Item {
            id: root
            width: ListView.view.width  // Always use it otherwise you will get error: TypeError: Cannot read property 'width' of null
            height: 52
            Row{
                //ListView.view is attached property hence cannot be used in child, you need to make property in root or use parent
                anchors.verticalCenter: root.verticalCenter
                spacing: 5

                Text {
                    leftPadding: 15
                    text: model.name
                    font.pixelSize: 20
                    color: "#2B4162"
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    id_list.currentIndex = index
                    load_path =  model.path
                    pathchanged()
                }
            }
        }

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
    }
}
