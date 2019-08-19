import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400
    leftPadding: 5
    property alias page: page
    clip: true

    header: Label {
        text: "check-in"
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: label
        x: -4
        y: 4
        color: "#60a6e9"
        text: qsTr("You are blocked, need authentication .")
        anchors.rightMargin: 18
        font.pointSize: 13
        anchors.fill: parent
        Rectangle {
            id: rectangle1
            x: 281
            y: 141
            width: 208
            height: 41
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 69
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 53
            visible: true
            clip: true
            TextInput {
                id: textInput1
                x: 261
                y: -68
                //                text: qsTr("Text Input")
                text: backend.UserPasswd
                visible: true
                clip: false
                padding: 0
                rightPadding: 0
                bottomPadding: -2
                topPadding: 0
                activeFocusOnPress: true
                autoScroll: true
                anchors.rightMargin: 8
                anchors.right: parent.right
                font.pixelSize: 20
                anchors.bottomMargin: 6
                anchors.leftMargin: 14
                anchors.topMargin: 8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                echoMode: TextInput.Password
            }
            border.color: "#e58888"
        }

        Rectangle {
            id: rectangle
            x: 281
            width: 208
            height: 50
            color: "#00000000"
            anchors.right: parent.right
            anchors.rightMargin: 69
            anchors.top: parent.top
            anchors.topMargin: 66
            clip: true
            TextInput {
                id: textInput2
                x: 3
                y: -33
                text: backend.UserName
                cursorVisible: false
                font.wordSpacing: 0
                font.letterSpacing: 0
                activeFocusOnPress: true
                //text: qsTr("name")
                autoScroll: true
                anchors.rightMargin: 8
                anchors.right: parent.right
                renderType: Text.QtRendering
                font.pixelSize: 20
                clip: false
                visible: true
                anchors.bottomMargin: 8
                anchors.leftMargin: 8
                anchors.topMargin: 8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
            }
            border.color: "#b32323"
        }

        Text {
            id: element1
            x: 139
            y: 148
            text: qsTr("PASSWORD")
            font.pixelSize: 22
            anchors.bottomMargin: 53
            anchors.leftMargin: 93
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        Text {
            id: element2
            x: 139
            y: 74
            text: qsTr("NAME")
            font.pixelSize: 22
            anchors.leftMargin: 93
            anchors.topMargin: 66
            anchors.left: parent.left
            anchors.top: parent.top
        }
        wrapMode: Text.NoWrap
        anchors.bottomMargin: 111
        horizontalAlignment: Text.AlignHCenter
        anchors.leftMargin: 19
        anchors.topMargin: 7
    }
}









/*##^## Designer {
    D{i:3;anchors_height:41;anchors_width:208;anchors_x:281;anchors_y:141}D{i:5;anchors_height:50;anchors_width:208;anchors_x:281;anchors_y:66}
}
 ##^##*/
