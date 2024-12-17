import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Column {
  spacing: 8
  PowerButton {
    id: powerButton
  }
  RebootButton {
    id: rebootButton
  }
  SleepButton {
    id: sleepButton
  }
}
