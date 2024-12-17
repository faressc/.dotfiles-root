import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: powerButton.height
  implicitWidth: powerButton.width
  Button {
    id: powerButton
    height: Screen.height * 0.035
    width: Screen.height * 0.035
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/power.svg")
      height: parent.height * 0.8
      width: parent.width * 0.8
      color: config.crust
    }
    background: Rectangle {
      id: powerButtonBackground
      radius: 3
      color: config.purple
      states: [
        State {
          name: "normal"
          when: !powerButton.hovered && !powerButton.pressed
          PropertyChanges {
            target: powerButtonBackground
            color: config.purple
          }
        },
        State {
          name: "hovered"
          when: powerButton.hovered && !powerButton.pressed
          PropertyChanges {
            target: powerButtonBackground
            color: config.orange
          }
        },
        State {
          name: "pressed"
          when: powerButton.pressed
          PropertyChanges {
            target: powerButtonBackground
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
    onClicked: sddm.powerOff()
  }
}
