import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15



Item {
    id: root
    x: 400
    y: 300
    property alias gameOverDialog: gameOverDialog
    property alias gumDialog: gumDialog
    //property alias dialog: dialog
    property int gum = 0;
    Rectangle {
              id: gameOverDialog
              width: 300; height: 450
              color: "black"
              visible: false
              anchors.centerIn: parent
              x: (parent.width - width) / 2
              y: (parent.height - height) / 2
              z:3000

              Image {
                  id: popupImage
                  source: "qrc:/pics/end.png"
                  anchors.horizontalCenter: parent.horizontalCenter
                  height: parent.height * 0.68
                  width: height
                  z:1000
                  fillMode: Image.PreserveAspectFit
              }

              Column {
                  anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
                  spacing: 10

                  Button {
                      id: button
                      text: "Try again"
                      flat: true

                      background: Rectangle {
                          color: "transparent"
                      }

                      contentItem: Text {
                          text: button.text
                          color: "lightgreen"
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }

                      onClicked: {
                          console.log("Button clicked.")
                          move.forceActiveFocus();
                          gameOverDialog.visible = false;
                      }
                  }



              }
      }

    Rectangle {
              id: gumDialog
              width: 300; height: 450
              color: "black"
              visible: false
              anchors.centerIn: parent
              x: (parent.width - width) / 2
              y: (parent.height - height) / 2
              z:3000


              Image {
                  id: popupImageGum
                  source: "qrc:/pics/gum.png"
                  anchors.horizontalCenter: parent.horizontalCenter
                  height: parent.height * 0.68
                  width: height
                  z:1000
                  fillMode: Image.PreserveAspectFit
              }

              Column {
                  anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
                  spacing: 10

                  Button {
                      id: buttonCake
                      text: "Take the Cake"
                      flat: true

                      background: Rectangle {
                          color: "transparent"
                      }

                      contentItem: Text {
                          text: buttonCake.text
                          color: "lightgreen"
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }

                      onClicked: {
                          console.log("Button clicked.")
                          move.forceActiveFocus();
                          player.visible = true;
                          gumDialog.visible = false;
                      }
                  }
                  Button {
                      id: buttonCoffee
                      text: "Drink coffee"
                      flat: true

                      background: Rectangle {
                          color: "transparent"
                      }

                      contentItem: Text {
                          text: buttonCoffee.text
                          color: "lightgreen"
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }

                      onClicked: {
                          console.log("Button clicked.")
                          move.forceActiveFocus();
                          player.visible = true;
                          gumDialog.visible = false;
                      }
                  }
                  Button {
                      id: buttonGun
                      text: "Take the Gun"
                      flat: true

                      background: Rectangle {
                          color: "transparent"
                      }

                      contentItem: Text {
                          text: buttonGun.text
                          color: "lightgreen"
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                      }

                      onClicked: {
                          console.log("Button clicked.")
                          move.forceActiveFocus();
                          player.visible = true;
                          gumDialog.visible = false;
                      }
                  }



              }
      }


}
