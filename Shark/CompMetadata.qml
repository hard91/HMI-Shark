import QtQuick
import QtQuick.Controls   // For Popup
import QtQuick.Layouts
import QtMultimedia

FocusScope{
    implicitHeight: 200
    implicitWidth: 300
    property bool isPlayable: mymediaPlayer.mediaStatus
    focus: true
    Image{
        id: meta
        width: 50
        height: 50
        source: "qrc:/res/assets/media_assets/info.png"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                elements.clear()
                read(mymediaPlayer.metaData)
                urlPopup.open()
            }
        }
    }

    Item{
        id: root
//        Rectangle{
//            color: "red"
//            opacity: .4
//            anchors.fill: parent
//        }

        height: parent.height
        width: parent.width - 150
        anchors.horizontalCenter: parent.horizontalCenter
        Component {
            id: rectDelegate;
            Item {
                id: wrapper;
                z: PathView.zOrder;
               // opacity: PathView.itemAlpha;
                scale: PathView.itemScale;
                Rectangle {
                    width: 100;
                    height: 100;
                    color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                    border.width: 2;
                    border.color: wrapper.PathView.isCurrentItem ? "red" : "lightgray";
                    Text {
                        anchors.centerIn: parent;
                        font.pixelSize: 28;
                        //text: index;
                        color: Qt.lighter(parent.color, 2);
                    }
                }
            }
        }

        PathView {
            id: pathView;
            anchors.fill: root;
            //anchors.horizontalCenter: root.horizontalCenter
            interactive: true;
            pathItemCount: 7;
            preferredHighlightBegin: 0.5;
            preferredHighlightEnd: 0.5;
            highlightRangeMode: PathView.StrictlyEnforceRange;

            delegate: rectDelegate;
            model: 200;

            path:Path {
                startX: 0;
                startY: 0;

                PathAttribute { name: "zOrder"; value: 0 }
                PathAttribute { name: "itemAlpha"; value: 0.1 }
                PathAttribute { name: "itemScale"; value: 0.6 }

                PathLine { x: root.width *0.4; y: 0 }
                PathPercent { value: 0.50; }
                PathLine { x: root.width *0.5 -50; y: 0 }

                PathAttribute { name: "zOrder"; value: 10 }
                PathAttribute { name: "itemAlpha"; value: 0.8 }
                PathAttribute { name: "itemScale"; value: 1.2 }

                PathLine { x: root.width *0.5; y: 0 }
                    //relativeX: parent.width/2 - 60;
                    //relativeY: 0;

                PathPercent { value: 0.60; }
                PathLine { x: root.width - 50; y: 0 }

                PathAttribute { name: "zOrder"; value: 0 }
                PathAttribute { name: "itemAlpha"; value: 0.1 }
                PathAttribute { name: "itemScale"; value: 0.6 }
            }

            focus: true;
            Keys.onLeftPressed: decrementCurrentIndex();
            Keys.onRightPressed: incrementCurrentIndex();
        }

    }

    ListModel {
        id: elements
    }

    function read(metadata) {
        if (metadata) {
            for (var key of metadata.keys()) {
                if (metadata.stringValue(key)) {
                    elements.append(
                                { name: metadata.metaDataKeyToString(key)
                                    , value: metadata.stringValue(key)
                                })
                }
            }
        }
    }
    Popup {
        id: urlPopup
        width: 250
        height: 150
        anchors.centerIn: parent.centerIn

        Text {
            id: metadataNoList
            visible: elements.count === 0
            text: qsTr("No metadata present")
        }
        ListView {
            id: metadataList
            visible: elements.count > 0
            anchors.fill: parent

            model: elements
            delegate: RowLayout {
                width: metadataList.width
                Text {
                    Layout.preferredWidth: 100
                    text: model.name + ":"
                    horizontalAlignment: Text.AlignRight
                }
                Text {
                    Layout.fillWidth: true
                    text: model.value
                    wrapMode: Text.WrapAnywhere
                }
            }
        }

        onOpened: { urlPopup.forceActiveFocus() }
    }
}
