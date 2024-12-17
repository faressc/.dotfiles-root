import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: passwordField
  selectByMouse: true
  echoMode: TextInput.Password
  passwordCharacter: "•"
  passwordMaskDelay: config.PasswordShowLastLetter
  hoverEnabled: true
  focus: true
  font {
    family: config.Font
    pointSize: config.FontSize - 5
  }
  color: config.background_dark
  horizontalAlignment: Text.AlignHCenter
  placeholderText: "Password"
  placeholderTextColor: config.background_dark
  background: Rectangle {
    id: loginBackground
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    width: parent.width * 1.2
    radius: 120
    visible: config.LoginBackground == "true" ? true : false
    color: config.text_bright_selected
    border.color: config.black
    border.width: 2
  }
}
