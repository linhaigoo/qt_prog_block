import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("USAGE HISTORY")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 12
        border.color: "#c94343"

        Label {
            color: "#2f3bbd"
            text: qsTr("NO record data")
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 6
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 18
        }
    }
}

/*##^## Designer {
    D{i:3;anchors_height:329;anchors_width:540;anchors_x:-8;anchors_y:-47}D{i:2;anchors_height:321;anchors_width:532;anchors_x:38;anchors_y:12}
}
 ##^##*/
