import QtQuick 2.0

Rectangle {
    width: 600
    height: 70
    radius: height/2
    color: "white"
    property alias applicationbar: my_list
    ListView{
        id : my_list

        width:  475//parent.width
        height: parent.height
        spacing: 35
        anchors.horizontalCenter:  parent.horizontalCenter

        orientation:  ListView.Horizontal
        //property int currentIndex: 1 // to select a particular index

        model: cpp_AppsDrawer
        delegate: Mybutton{
            btnimg: qml_icon
            btntext.text: qml_longName

            selected:{
                if(my_list.currentIndex === index)
                    return true;
                else
                    return false;
            }
            onButtonPressed: {
                console.log(my_list.currentIndex,index)
            }
           onButtonRelease:  {
               my_list.currentIndex = index
               activateApp(qml_name, index);
               console.log(my_list.currentIndex,index)
               console.log("Activate app",qml_name)
           }
        }
    }
}
