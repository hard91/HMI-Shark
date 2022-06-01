import QtQuick 2.0
import QtQuick.Layouts 1.1

FocusScope{
    id: home_main

    Row{
        spacing: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        TilePhone{
            id : phoneTile
        }
        TileMedia{
            id : mediaTile
        }
        TileNavigation{
            id : navTile
        }
    }
}
