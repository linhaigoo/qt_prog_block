import QtQuick 2.9
import QtQuick.Controls 2.2

import io.qt.backend 1.0

ApplicationWindow {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("block")
    flags: Qt.FramelessWindowHint|Qt.WindowStaysOnTopHint

    BackEnd {
        id: backend
    }

    Timer{
        id:time_checker
        interval: 5000
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            backend.TimeChecker = true
            mainWindow.setX(backend.BlockRect.x)
            mainWindow.setY(backend.BlockRect.y)
            mainWindow.setGeometry(backend.BlockRect.x,backend.BlockRect.y,backend.BlockRect.width,backend.BlockRect.height)
            mainWindow.setVisible(backend.TimeChecker)
//            mainWindow.setVisible(!mainWindow.visible)
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }

        Page3Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Authentication")
        }
        TabButton {
            text: qsTr("Record")
        }
//        TabButton {
//            text: qsTr("User Mangement")
//        }
    }

    Component.onCompleted: time_checker.start()

}
