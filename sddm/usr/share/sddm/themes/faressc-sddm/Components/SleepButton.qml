import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Item {
  implicitHeight: sleepButton.height
  implicitWidth: sleepButton.width
  Button {
    id: sleepButton
    height: Screen.height * 0.035
    width: Screen.height * 0.035
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/sleep.svg")
      height: parent.height * 0.8
      width: parent.width * 0.8
      color: config.crust
    }
    background: Rectangle {
      id: sleepButtonBackground
      radius: 3
      color: config.purple
      states: [
        State {
          name: "normal"
          when: !sleepButton.hovered && !sleepButton.pressed
          PropertyChanges {
            target: sleepButtonBackground
            color: config.purple
          }
        },
        State {
          name: "hovered"
          when: sleepButton.hovered && !sleepButton.pressed
          PropertyChanges {
            target: sleepButtonBackground
            color: config.orange
          }
        },
        State {
          name: "pressed"
          when: sleepButton.pressed
          PropertyChanges {
            target: sleepButtonBackground
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
    onClicked: sddm.suspend()
  }
}
