import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
  property var session: sessionList.currentIndex
  implicitHeight: sessionButton.height
  implicitWidth: sessionButton.width
  Button {
    id: sessionButton
    height: Screen.height * 0.035
    width: Screen.height * 0.035
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/settings.svg")
      height: parent.height * 0.8
      width: parent.width * 0.8
      color: config.crust
    }
    background: Rectangle {
      id: sessionButtonBackground
      radius: 3
      color: config.purple
      states: [
        State {
          name: "normal"
          when: !sessionButton.hovered && !sessionButton.pressed
          PropertyChanges {
            target: sessionButtonBackground
            color: config.purple
          }
        },
        State {
          name: "hovered"
          when: sessionButton.hovered && !sessionButton.pressed
          PropertyChanges {
            target: sessionButtonBackground
            color: config.orange
          }
        },
        State {
          name: "pressed"
          when: sessionButton.pressed
          PropertyChanges {
            target: sessionButtonBackground
            color: config.red
          }
        }
      ]
      transitions: Transition {
        from: "normal"
        to: "hovered"
        reversible: true
        PropertyAnimation {
          properties: "color"
          duration: 300
        }
      }
    }
    onClicked: {
      sessionPopup.visible ? sessionPopup.close() : sessionPopup.open()
      sessionButton.state = "pressed"
    }
  }
  Popup {
    id: sessionPopup
    width: Screen.width * 0.18 + padding * 2
    x: (sessionButton.width + sessionList.spacing) * -7.6
    y: -(contentHeight + padding * 2) + sessionButton.height
    padding: Screen.height * 0.035 / 10
    background: Rectangle {
      radius: 5.4
      color: config.black
    }
    contentItem: ListView {
      id: sessionList
      implicitHeight: contentHeight
      spacing: 8
      model: sessionWrapper
      currentIndex: sessionModel.lastIndex
      clip: true
    }
    enter: Transition {
      ParallelAnimation {
        NumberAnimation {
          property: "opacity"
          from: 0
          to: 1
          duration: 400
          easing.type: Easing.OutExpo
        }
        NumberAnimation {
          property: "x"
          from: sessionPopup.x + (Screen.width * 0.035 * 0.1)
          to: sessionPopup.x
          duration: 500
          easing.type: Easing.OutExpo
        }
      }
    }
    exit: Transition {
      NumberAnimation {
        property: "opacity"
        from: 1
        to: 0
        duration: 300
        easing.type: Easing.OutExpo
      }
    }
  }
  DelegateModel {
    id: sessionWrapper
    model: sessionModel
    delegate: ItemDelegate {
      id: sessionEntry
      height: Screen.height * 0.035
      width: parent.width
      highlighted: sessionList.currentIndex == index
      contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.FontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: config.text_bright_selected
        text: name
      }
      background: Rectangle {
        id: sessionEntryBackground
        color: config.background_dark
        radius: 3
      }
      states: [
        State {
          name: "hovered"
          when: sessionEntry.hovered
          PropertyChanges {
            target: sessionEntryBackground
            color: config.background_dark_selected
          }
        }
      ]
      transitions: Transition {
        PropertyAnimation {
          property: "color"
          duration: 300
        }
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          sessionList.currentIndex = index
          sessionPopup.close()
        }
      }
    }
  }
}
