import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "."
/*
  TODO
  add more barriers to lvl2 OK
  make pic for lvl2 OK
  add dialogs for lvl 1
  remove visabiliti of barriers OK
  apply shadow for lvl 2 OK
  add goals in lvl 2
  add player icon
  animate player icon
  add main menu
  add sound
  */
Window {
    id: window
    visible: true
    width: 800
    height: 600
    title: "Background Image Example"

    //===blabla
    property int playerX: 600
    property int playerY: 360
    property int goalX: 320
    property int goalY: 170
 //door main room
     property int door1X: 690
     property int door1Y: 270
    property int doppleX: 210
    property int doppleY: 440
    property bool showPopup: false
    property var barriers: [
         {x: 50, y: 30, width: 700, height: 50},
        {x: 700, y: 30, width: 50, height: 230}, //left up
        {x: 700, y: 330, width: 50, height: 230}, //left down
        {x: 50, y: 30, width: 50, height: 500},
        {x: 50, y: 530, width: 700, height: 50},
         {x: 400, y: 400, width: 50, height: 50},
        {x: 320, y: 100, width: 70, height: 70}, //the gum
        {x: 600, y: 100, width: 50, height: 70},//giant
        {x: 160, y: 410, width: 50, height: 70},//doppleganger
        {x: 140, y: 180, width: 50, height: 50},//sofe
         // Add more barriers as needed...
     ]


    //========= timer

    Timer {
            id: dialogTimer
            interval: 6000 // Set interval to 4 seconds
            running: false // Initially, the timer is not running
            repeat: false  // Do not repeat the timer
            onTriggered: dialog.visible = false // When the timer is triggered, hide the dialog
        }

    //========= funcs
    function showDialog(customText, customTitle) {
        dialogText.text = customText
        dialogTitle.text = customTitle
        dialog.visible = true
        dialogTimer.start()
    }
    function collidesWithBarrier(x, y, width, height) {
          for (var i = 0; i < barriers.length; i++) {
              var barrier = barriers[i];
              if (x < barrier.x + barrier.width &&
                  x + width > barrier.x &&
                  y < barrier.y + barrier.height &&
                  y + height > barrier.y) {
                  return true;
              }
          }
          return false;
      }
    function moveToNewLevel() {
        // Set up the new level
        // ...

        // Update the barriers
        barriers = [
           {x: 0, y: 0, width: 800, height: 50},
           {x: 0, y: 0, width: 50, height: 600}, //left up
           {x: 0, y: 550, width: 800, height: 50}, //left down
           {x: 750, y: 0, width: 50, height: 600},
           {x: 300, y: 360, width: 500, height: 20},
           {x: 300, y: 260, width: 350, height: 20},
           {x: 220, y: 290, width: 20, height: 500},
           {x: 300, y: 360, width: 20, height: 50},
            {x: 300, y: 400, width: 500, height: 20},
           {x: 600, y: 400, width: 20, height: 100},
            {x: 300, y: 480, width: 200, height: 20},
           {x: 500, y: 480, width: 20, height: 100},
           {x: 300, y: 100, width: 20, height: 170},
           {x: 430, y: 50, width: 20, height: 150},
           {x: 550, y: 130, width: 20, height: 150},
           {x: 110, y: 180, width: 200, height: 20},
           {x: 110, y: 180, width: 20, height: 400},
        ];

        // Set player to new starting position
        player.x = 400
        player.y = 300
        door.visible=false;
        levelLoader.sourceComponent = Qt.createComponent("level2.qml");
    }
    //=====shadow

    //======
    //popups

    //main
    //==============
    Item {
        id: gameArea
        anchors.fill: parent

        Image {
            id: backgroundImage
            anchors.fill: parent
            source: "qrc:/pics/welcomRoom.png"
            fillMode: Image.PreserveAspectCrop
        }

        Popups {
             id: popups
         }

        Loader {
            id: levelLoader
            anchors.fill: parent
            sourceComponent: currentLevel
        }

        //debug buttons
        Row  {
            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
            spacing: 10
        Button {
            text: "Next Level"
            onClicked: {
                moveToNewLevel()
            }
        }
        Button {
            text: "dialog"
            onClicked: {
                showDialog("t̵͆ͅh̷̭̉í̶̺s̴̭͝ ̴̱̄ḭ̸̽s̴͉͝, ", "Sample")
            }
        }
}
        Rectangle {
            id: player
            width: 50
            height: 50
            color: "red"
            x: 400
            y: 300
            visible: true
        }
        Rectangle {
            id: door
            width: 200
            height: 50
            color: "black"
            x: door1X
            y: door1Y
            visible: false
        }
        //dialog
        Rectangle {
                id: dialog
                width: parent.width  // Width same as the parent (Window)
                height: 100          // Height of the dialog
                color: "black"        // Color of the dialog
                anchors.bottom: parent.bottom // Attach the dialog to the bottom of the parent (Window)
                visible: false       // Initially, the dialog is not visible
                Text {
                           id: dialogTitle
                           text: ""
                           anchors.top: parent.top
                           anchors.left: parent.left
                           horizontalAlignment: Text.AlignLeft
                           color: "lightgreen"
                           font.pixelSize: 16 // Change the size as needed
                          // font.bold: true
           }
                Text {
                    id: dialogText
                    text: ""          // Initially, the text is empty
                    anchors.centerIn: parent // Center the text inside the dialog (Rectangle)
                    color: "lightgreen"
                     font.pixelSize: 16

                }

            }
//show barriers
//        Repeater {
//            model: barriers
//            Rectangle {
//                width: modelData.width
//                height: modelData.height
//                color: "blue"
//                x: modelData.x
//                y: modelData.y
//            }
//        }


        }





    Item {
        id: move
        focus: true
        Keys.onPressed: {
            var stepSize = 10;
            var newX = player.x;
            var newY = player.y;
            if (event.key === Qt.Key_A) {
                newX -= stepSize;
            } else if (event.key === Qt.Key_D) {
                newX += stepSize;
            } else if (event.key === Qt.Key_W) {
                newY -= stepSize;
            } else if (event.key === Qt.Key_S) {
                newY += stepSize;
            }
            if (!collidesWithBarrier(newX, newY, player.width, player.height)) {
                player.x = newX;
                player.y = newY;
                console.log("x y");
                console.log(newX);
                console.log(newY);
                if (player.x === goalX && player.y === goalY) {
                    popups.gumDialog.visible = true;
                    move.focus = false;
                    player.visible = false;

                    console.log("the gum");
                    door.visible=true;
                }
                else if (player.x === door1X && player.y === door1Y) {
                    moveToNewLevel();

                }
                else if (player.x === doppleX && player.y === doppleY) {
                    showDialog("t̵͆ͅh̷̭̉í̶̺s̴̭͝ ̴̱̄ḭ̸̽s̴͉͝ ̴̛̼ă̸̰ ̷͚͘d̸̞̄ȓ̸̠ë̸͇́a̷͇̐m̸̼̽.̵͖̓ ̷̛͈b̶̡͘u̵͉͘t̵͖́ ̷̞̌ẘ̵̢h̷̯͐õ̸̧ ̷̟͠i̵̳̊s̸̳̀ ̸̱̄ť̴̻h̶̘̑e̸̝̓ ̶̯͂d̴̥̉r̸͓̂e̴̱̽a̶̗͒m̸͍͘e̴̘̔r̵͕͘?̷̤̽", "DOPPLEGANGER")
                    console.log("doppledopple");
                }
            }
        }
    }



}
