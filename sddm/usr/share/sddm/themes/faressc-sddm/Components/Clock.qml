import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Label {
  id: time
  color: config.text_bright_selected
  font {
    family: config.Font
    pixelSize: 82
  }
  text: new Date().toLocaleString(Qt.locale(), "hh:mm AP")
  Timer {
    id: timer
    // TODO: How fast shall the intervall be
    interval: 20
    repeat: true
    running: true
    
    onTriggered: {
      time.text = new Date().toLocaleString(Qt.locale(), "hh:mm AP")
    }
  }
}


