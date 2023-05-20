import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15



Item {
    id: root
    x: 400
    y: 300
    property alias gameOverDialog: gameOverDialog
    property alias gumDialog: gumDialog
    property alias winDialog: winDialog
    property int gum: 0

    Rectangle {
              id: mainmenu
              width: 800; height: 600
              color: "black"
              visible: false
              anchors.centerIn: parent
              x: (parent.width - width) / 2
              y: (parent.height - height) / 2
              z:3000

              Image {
                  id: popupImage
                  source: "qrc:/pics/mainmenu.png"
                  anchors.horizontalCenter: parent.horizontalCenter
                  height: parent.height - 50
                  width: parent.width
                  z:1000
                  fillMode: Image.PreserveAspectFit
              }


      }

    Rectangle {
              id: gameOverDialog
              width: 800; height: 600
              color: "black"
              visible: false
              anchors.centerIn: parent
              x: (parent.width - width) / 2
              y: (parent.height - height) / 2
              z:3000

              Image {
                  id: popupImagemm
                  source: "qrc:/pics/end.png"
                  anchors.horizontalCenter: parent.horizontalCenter
                  height: parent.height - 50
                  width: parent.width
                  z:1000
                  fillMode: Image.PreserveAspectFit
              }

              Column {
                  anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
                  spacing: 10

                  Button {
                      id: button
                      text: ">Try again"
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
                          move.forceActiveFocus();
                          gameOverDialog.visible = false;
                          player.visible = true;
                          moveToNewLevel();
                      }
                  }



              }
      }

    Rectangle {
        id: winDialog
        width: 800; height: 600
        color: "black"
        visible: false
        anchors.centerIn: parent

        Column {
            anchors.centerIn: parent
            spacing: 10

            Text {
                id: winText
                text: "CONGRATION"
                color: "lightgreen"
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: popupImagewin
                source: "qrc:/pics/win.png"
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height * 0.5
                width: parent.width
                fillMode: Image.PreserveAspectFit
            }

            Button {
                id: buttonwin
                text: " >MAIN MENU"
                flat: true
                anchors.horizontalCenter: parent.horizontalCenter

                background: Rectangle {
                    color: "transparent"
                }

                contentItem: Text {
                    text: buttonwin.text
                    color: "lightgreen"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    move.forceActiveFocus();
                    winDialog.visible = false;
                    player.visible = true;
                     restartGame();
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
                      anchors.horizontalCenter: parent.horizontalCenter

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
                          showDialog("Ḯ̵̠̳͔̈͋s̷̞̗̘̝̽͐͆͝ ̵̡̘̠͎̓͊́̇į̵͍͊͊̂ṫ̶̞́̃͑ ̸̧̛͂̎̾ͅͅt̷̯̔ḥ̵̾̒e̷̥̭̩̭͝ ̵̜̇f̸̝̰͝u̵͚̦̞̬̾͊͆t̴̢̢͊̈u̴̧͉͆̄̈͝r̵̠̳͊e̶̢̪̮̿̒ ̵͓̾̐̆͝o̷͎̠̝͊r̷̠͍̘̎̈̉̈́ ̸̼̗̱͗̽͒̍͜i̵͚͖̼͑̀s̴̱͎̆͘ ̷͉̈́̈ḯ̶̤́̾ͅt̸̝̖̀ ̸̦͋̑ţ̷͙͇̳͛͒h̵̢͖̃̆͠͝e̸̓ͅ ̸̦̓̎p̶̺̪̫̑́̇a̸̛̝̋͒͛s̵̳̫̆̍̎t̸̳̝̯̅̇̿̑?̴̪̺̮̓̇̾͜ ̷̡̘̔ͅ", "MIDGET")
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
                          move.forceActiveFocus();
                          player.visible = true;
                          gumDialog.visible = false;
                          player.item = 1;
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
                          move.forceActiveFocus();
                          player.visible = true;
                          gumDialog.visible = false;
                          player.item = 2;
                      }
                  }



              }
      }


}
