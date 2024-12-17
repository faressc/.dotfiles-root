import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
  property var user: userField.text
  property var password: passwordField.text
  property var session: sessionPanel.session
  UserField {
    id: userField
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    height: Screen.height * 0.063
    width: Screen.width * 0.16
  }
  PasswordField {
    id: passwordField
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
      verticalCenterOffset: Screen.height * 0.070
    }
    height: Screen.height * 0.04
    width: Screen.width * 0.11
    onAccepted: sddm.login(user, password, session)
  }
  Connections {
    target: sddm
    function onLoginFailed() {
      passwordField.text = ""
      passwordField.focus = true
    }
  }
}
