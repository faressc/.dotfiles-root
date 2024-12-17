import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: userField
  selectByMouse: true
  echoMode: TextInput.Normal
  hoverEnabled: true
  font {
    family: config.Font
    pointSize: config.FontSize
  }
  color: config.text_bright_selected
  horizontalAlignment: Text.AlignHCenter
  placeholderText: "Username"
  placeholderTextColor: config.text_bright
  text: userModel.lastUser
  background: Rectangle {
    id: loginBackground
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    width: parent.width * 1.2
    radius: 120
    visible: config.LoginBackground == "true" ? true : false
    color: config.background_dark
    border.color: config.purple
    border.width: 5
  }
  states: [
    State {
      name: "focused"
      when: userField.activeFocus
      PropertyChanges {
        loginBackground {
          color: config.background_dark_selected
        }
      }
    },
    State {
      name: "hovered"
      when: userField.hovered
      PropertyChanges {
        loginBackground {
          color: config.background_dark_selected
        }
      }
    }
  ]
  transitions: Transition {
    PropertyAnimation {
      properties: "color"
      duration: 300
    }
  }
}
