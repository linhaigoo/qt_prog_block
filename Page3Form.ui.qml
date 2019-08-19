import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400
    property alias button: button

    header: Label {
        text: qsTr("USER MANAGEMENT")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: label
        color: "#60a6e9"
        text: qsTr("Add USER or Modify passwd")
        anchors.rightMargin: 20
        anchors.leftMargin: 17
        anchors.topMargin: 6
        anchors.bottomMargin: 26
        anchors.fill: parent
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 13

        Rectangle {
            id: rectangle1
            x: 281
            y: 141
            width: 208
            height: 41
            color: "#ffffff"
            border.color: "#e58888"

            TextInput {
                id: textInput1
                x: 261
                y: -68
                text: qsTr("Text Input")
                echoMode: TextInput.PasswordEchoOnEdit
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 14
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 6
                anchors.top: parent.top
                anchors.topMargin: 8
                font.pixelSize: 20
            }
        }

        Rectangle {
            id: rectangle
            x: 281
            y: 66
            width: 208
            height: 50
            color: "#00000000"
            border.color: "#b32323"

            TextInput {
                id: textInput
                x: 3
                y: -33
                text: qsTr("name")
                renderType: Text.QtRendering
                clip: false
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 8
                font.pixelSize: 20
            }
        }

        Text {
            id: element1
            x: 139
            y: 148
            text: qsTr("PASSWORD")
            anchors.right: parent.right
            anchors.rightMargin: 346
            anchors.left: parent.left
            anchors.leftMargin: 102
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 151
            anchors.top: parent.top
            anchors.topMargin: 141
            font.pixelSize: 22
        }

        Text {
            id: element
            x: 139
            y: 74
            text: qsTr("NAME")
            anchors.left: parent.left
            anchors.leftMargin: 102
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 215
            anchors.right: parent.right
            anchors.rightMargin: 398
            anchors.top: parent.top
            anchors.topMargin: 76
            font.pixelSize: 22
        }

        Button {
            id: button
            x: 229
            y: 234
            text: qsTr("confirm")
        }




    }
}






/*##^## Designer {
    D{i:4;anchors_height:20;anchors_width:80;anchors_x:305;anchors_y:121}D{i:6;anchors_height:14;anchors_width:45;anchors_x:182;anchors_y:121}
D{i:5;anchors_height:21;anchors_width:295}D{i:7;anchors_height:14;anchors_width:63;anchors_x:182;anchors_y:152}
D{i:8;anchors_height:14;anchors_width:45;anchors_x:182;anchors_y:121}D{i:9;anchors_height:20;anchors_width:80;anchors_x:305;anchors_y:152}
D{i:2;anchors_height:21;anchors_width:295}
}
 ##^##*/
