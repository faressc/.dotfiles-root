import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width
  Image {
    id: backgroundImage
    anchors.fill: parent
    height: parent.height
    width: parent.width
    fillMode: Image.PreserveAspectCrop
    visible: config.CustomBackground == "true" ? true : false
    z: 1
    source: config.Background
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }
  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent
      margins: 50
    }
    Clock {
      id: time
      visible: config.ClockEnabled == "true" ? true : false
      anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -Screen.height * 0.25
      }
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
      z: 5
    }
    PowerStatePanel {
      id: powerStatePanel
      anchors {
        bottom: parent.bottom
        left: parent.left
      }
      z: 5
    }
    SessionPanel {
      id: sessionPanel
      anchors {
        bottom: parent.bottom
        right: parent.right
      }
      z: 5
    }
  }
}
