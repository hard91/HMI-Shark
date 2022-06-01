import QtQuick 2.0
FocusScope{
    GridView {
        id:appsView
        height: 200
        width: 300
        focus: true
        cellWidth: 100
        cellHeight: 100
        // interactive: false
        flickableDirection: Flickable.HorizontalFlick
        clip: true

        flow:  GridView.FlowTopToBottom
        LayoutMirroring.enabled: true
        layoutDirection: GridView.RightToLeft
        verticalLayoutDirection: GridView.TopToBottom

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        model: cpp_AppsDrawer
        currentIndex: -1

        Component {
            id: gridDelegate
            Item {
                width: appsView.cellWidth;
                height: appsView.cellHeight

                Image {
                    id: icon
                    source: qml_icon;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: icon_text
                    text: qml_longName;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.top: icon.bottom
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed:  {
                        appsView.currentIndex = index
                    }
                    onReleased: {
                        activateApp(qml_name, index);
                        console.log("Clicked on :"+ index )
                    }
                }
            }

        }
        delegate: gridDelegate

        highlight: Rectangle { color: "#FFC300"; radius: width/2 }


    }
}

