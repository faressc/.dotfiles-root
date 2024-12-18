import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: rebootButton.height
  implicitWidth: rebootButton.width
  Button {
    id: rebootButton
    height: Screen.height * 0.035
    width: Screen.height * 0.035
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/reboot.svg")
      height: parent.height * 0.8
      width: parent.width * 0.8
      color: config.crust
    }
    background: Rectangle {
      id: rebootButtonBackground
      radius: 3
      color: config.purple
      states: [
        State {
          name: "normal"
          when: !rebootButton.hovered && !rebootButton.pressed
          PropertyChanges {
            target: rebootButtonBackground
            color: config.purple
          }
        },
        State {
          name: "hovered"
          when: rebootButton.hovered && !rebootButton.pressed
          PropertyChanges {
            target: rebootButtonBackground
            color: config.orange
          }
        },
        State {
          name: "pressed"
          when: rebootButton.pressed
          PropertyChanges {
            target: rebootButtonBackground
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
    onClicked: sddm.reboot()
  }
}
