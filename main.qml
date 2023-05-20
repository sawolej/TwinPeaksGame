import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "."
import QtMultimedia 5.15


/*
  TODO
  add barriers to lvl2 OK
  make pic for lvl2 OK
  add dialogs for lvl 1 OK
  remove visabiliti of barriers OK
  apply shadow for lvl 2 OK
  add goals in lvl 2 OK
  add main menu OK

  make orbs in lvl1 OK
  make door OK
  make dialog in lvl2 OK
  move the gum man collider OK
  add player icon OK
  animate player icon OK
  buttons in ending screens
  add sound
  */
Window {
    id: window
    visible: true
    width: 800
    height: 600
    title: "tp"
//    Audio {
//        id: backgroundMusic
//        source: "qrc:/pics/tptlo.mp3" // replace this with your actual file path
//        loops: Audio.Infinite
//        volume: 0.5 // adjust volume as needed (0.0 to 1.0)
//        autoPlay: true
//    }

//================================================ init ======================================================
    property int playerX: 600
    property int playerY: 360
    property int goalX: 320
    property int goalY: 170
     property int door1X: 690
     property int door1Y: 270
    property int doppleX: 210
    property int doppleY: 440
    property int giantX: 580
    property int giantY: 100
    property bool newLvl: false
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
        {x: 140, y: 180, width: 50, height: 70},//sofe
         // Add more barriers as needed...
     ]


//================================================ timer ======================================================
    Timer {
            id: dialogTimer
            interval: 6000 // Set interval to 4 seconds
            running: false // Initially, the timer is not running
            repeat: false  // Do not repeat the timer
            onTriggered: dialog.visible = false // When the timer is triggered, hide the dialog
        }

//================================================ funcs ======================================================
    function showDialog(customText, customTitle) {
        dialogText.text = customText
        dialogTitle.text = customTitle
        dialog.visible = true
        dialogTimer.start()
    }
    function checkCollision(){
        if(!newLvl){
                //gum
                if (player.x === goalX +20 && player.y === goalY) {
                    collision("gum")
                }
                //door
                else if (player.x === door1X && player.y === door1Y) {
                    moveToNewLevel();
                }

                if (collidesWithRectangle(player.x, player.y,50, 50, giantX, giantY, 50, 70)){
                    collision("giant")
                } else if (collidesWithRectangle(player.x, player.y,50, 50, doppleX, doppleY, 50, 70)){
                    collision("dopple")
                }else if (collidesWithRectangle(player.x, player.y,50, 50, owls.animatedOwl.x, owls.animatedOwl.y, 100, 100)){
                    if(owls.animatedOwl.visible === true)showDialog("OUCH!", "")
                }}
                else{
                    if (collidesWithRectangle(player.x, player.y,50, 50, 150, 490, 50, 50)){
                       collision("red")
                    }
                    //red baal
                    else if (collidesWithRectangle(player.x, player.y,50, 50, 670, 490, 50, 50)){
                        collision("red")
                    }
                    //gold baal
                    else if (collidesWithRectangle(player.x, player.y,50, 50, 70, 100, 50, 50)){
                        collision("gold")
                    }
                }
    }

    function collision(s){
        if(s==="gum"){
                     popups.gumDialog.visible = true;
            move.focus = false;
            player.visible = false;
            console.log("the gum");
            goldBall2.visible = false;
        }else if(s==="dopple"){
            showDialog("t̵͆ͅh̷̭̉í̶̺s̴̭͝ ̴̱̄ḭ̸̽s̴͉͝ ̴̛̼ă̸̰ ̷͚͘d̸̞̄ȓ̸̠ë̸͇́a̷͇̐m̸̼̽.̵͖̓ ̷̛͈b̶̡͘u̵͉͘t̵͖́ ̷̞̌ẘ̵̢h̷̯͐õ̸̧ ̷̟͠i̵̳̊s̸̳̀ ̸̱̄ť̴̻h̶̘̑e̸̝̓ ̶̯͂d̴̥̉r̸͓̂e̴̱̽a̶̗͒m̸͍͘e̴̘̔r̵͕͘?̷̤̽", "DOPPLEGANGER")
            console.log("doppledopple");
            owls.animatedOwl.visible = true
            goldBall1.visible = false;
        }else if(s==="giant"){
            console.log("giant")
            showDialog("Ŷ̷̲̲̀Ŏ̶͚U̷͚͊͘ ̵̗̇̄c̸͖̹̔̅͝͝á̴̮͇̪͖̍͠ň̴̝̝͗ ̸̻͇̦̇̋́g̵̖͙͉̟̈́̌͘ǫ̶̼̬͐͒̇̍ ̴̙̼̥̈́̒͘͠n̷̯͇̫̐͒̄̋o̵͈͕̦̹͋w̶̙̯̫̒̎̉", "GIANT")
            goldBall3.visible = false;
            door.visible=true;
        }else if(s==="red"){
            console.log("red")
            popups.gameOverDialog.visible = true;
            owls.animatedOwl.visible = false;
            player.visible = false;
            levelLoader.sourceComponent = Qt.createComponent("end.qml");
        }else if(s==="gold"){
            console.log("gold")
            popups.winDialog.visible = true;
            owls.animatedOwl.visible = false;
            player.visible = false;
            levelLoader.sourceComponent = Qt.createComponent("end.qml");
            }
    }

    function changeDale(s){
        if (s==="left"){
            if(player.item===0)player.source= "qrc:/pics/daleLeft.png"
            else if(player.item===1)player.source= "qrc:/pics/daleCoffeeLeft.png"
            else if(player.item===2)player.source= "qrc:/pics/daleGunLeft.png"
        }else if(s==="right"){
            if(player.item===0)player.source= "qrc:/pics/daleRight.png"
            else if(player.item===1)player.source= "qrc:/pics/daleCoffeeRight.png"
            else if(player.item===2)player.source= "qrc:/pics/daleGunRight.png"
        }else if(s==="up"){
            player.source= "qrc:/pics/daleBack.png"
        }else if(s==="down"){
            if(player.item===0||player.item===2)player.source= "qrc:/pics/daleFront.png"
            else if(player.item===1)player.source= "qrc:/pics/daleCoffeeFront.png"
        }
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
    function collidesWithRectangle(playerX, playerY, playerWidth, playerHeight, rectX, rectY, rectWidth, rectHeight) {
        if (playerX < rectX + rectWidth &&
            playerX + playerWidth > rectX &&
            playerY < rectY + rectHeight &&
            playerY + playerHeight > rectY) {
            return true;
        }
        return false;
    }
    function moveToNewLevel() {
        // Set up the new level
        showDialog("FIND RIGHT ORB TO GET OUT OF HERE", "")
        goldBall1.visible = false;
        goldBall2.visible = false;
        goldBall3.visible = false;

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
        owls.animatedOwl.visible = false;
        newLvl=true;
    }
    function restartGame() {
        // Reset player position
        player.x = 400;
        player.y = 300;
        newLvl = false
        player.item = 0;
        // Reset door position
        door.x = door1X;
        door.y = door1Y;
        door.visible = false;
        owls.animatedOwl.visible = false;

        // Reset level
        levelLoader.sourceComponent = null;
        newLvl = false;

        // Reset dialog visibility
        dialog.visible = false;
        popupImagemm.visible = true;
        goldBall1.visible = true;
        goldBall2.visible = true;
        goldBall3.visible = true;
        // Reset barriers
        barriers = [
            {x: 50, y: 30, width: 700, height: 50},
            {x: 700, y: 30, width: 50, height: 230}, //left up
            {x: 700, y: 330, width: 50, height: 230}, //left down
            {x: 50, y: 30, width: 50, height: 500},
            {x: 50, y: 530, width: 700, height: 50},
            {x: 400, y: 400, width: 50, height: 50},
            {x: 320, y: 100, width: 70, height: 70}, //the gum
            {x: 600, y: 100, width: 50, height: 70},//giant
            {x: 160, y: 410, width: 50, height: 70},//doppleganger
            {x: 140, y: 180, width: 50, height: 70},//sofe
        ];
    }


//================================================ main game area ======================================================
    Item {
        id: gameArea
        anchors.fill: parent
        Image {
               id: popupImagemm
               source: "qrc:/pics/mainmenu.png"
               anchors.fill: parent
               fillMode: Image.PreserveAspectCrop
               z:4000

               MouseArea {
                   id: imageMouseArea
                   anchors.fill: parent
                   onClicked: {
                       popupImagemm.visible = false;
                   }
               }
           }

        Image {
            id: backgroundImage
            anchors.fill: parent
            source: "qrc:/pics/welcomRoom.png"
            fillMode: Image.PreserveAspectCrop
        }

        Popups {
             id: popups
         }

        Owls {
             id: owls
         }

        Loader {
            id: levelLoader
            anchors.fill: parent
           // sourceComponent: currentLevel
        }

        Image {
            id: goldBall1
            width: 20
            height: 20
            visible: true;
            source: "qrc:/pics/goldBall.png"
            x: doppleX - 35
            y: doppleY -50
            z: 2000

            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: doppleY -50
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: doppleY -60
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Image {
            id: goldBall2
            width: 20
            height: 20
            visible: true;
            source: "qrc:/pics/goldBall.png"
            x: goalX + 30
            y: goalY -110
            z: 2000

            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: goalY-100
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: goalY-110
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Image {
            id: goldBall3
            width: 20
            height: 20
            visible: true;
            source: "qrc:/pics/goldBall.png"
            x: giantX  +39
            y: giantY -40
            z: 2000


            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: giantY -30
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: giantY -40
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        //debug buttons
//        Row  {
//            anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
//            spacing: 10
//        Button {
//            text: "Next Level"
//            onClicked: {
//                moveToNewLevel()
//            }
//        }
//        Button {
//            text: "dialog"
//            onClicked: {
//                showDialog("t̵͆ͅh̷̭̉í̶̺s̴̭͝ ̴̱̄ḭ̸̽s̴͉͝, ", "Sample")
//            }
//        }
//}

        Image {
            id: player
            width: 50
            height: 50
            source: "qrc:/pics/daleFront.png"
            fillMode: Image.PreserveAspectCrop
            x: 400
            y: 300
            visible: true
            property int item: 0;
        }
        Image {
            id: door
            width: 150
            height: 60
            source: "qrc:/pics/kurtyna.png"
            fillMode: Image.PreserveAspectCrop
            x: door1X - 30
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



//================================================ movin ======================================================

    Item {
        id: move
        focus: true
        Keys.onPressed: {
            var stepSize = 10;
            var newX = player.x;
            var newY = player.y;
            if (event.key === Qt.Key_A) {
                newX -= stepSize;
                changeDale("left")
            } else if (event.key === Qt.Key_D) {
                newX += stepSize;
                changeDale("right")
            } else if (event.key === Qt.Key_W) {
                newY -= stepSize;
                changeDale("up")
            } else if (event.key === Qt.Key_S) {
                newY += stepSize;
                changeDale("down")
            }
            if (!collidesWithBarrier(newX, newY, player.width, player.height)) {
                   player.x = newX;
                   player.y = newY;
                   checkCollision()

               }

        }
    }



}
