import QtQuick 2.15
import QtQuick.Window 2.15
import "."


Rectangle {

    property int playerX: 600
    property int playerY: 360


    id: level2Window
    visible: true
    width: 800
    height: 600
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/pics/tlo2.png"
        fillMode: Image.PreserveAspectCrop
    }
//workin light
    Image {
        width: 4000
        height: 2000
        id: darkness
        source: "qrc:/pics/darkness.png"
        x: (player.x+87) - width / 2
        y: (player.y+147) - height / 2
        z:3000
    }

    //orbs

        Image {
            id: goldBall
            width: 50
            height: 50
            source: "qrc:/pics/goldBall.png"
            x: 70
            y: 100
            z: 2000

            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: 85
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: 100
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Image {
            id: redBall
            width: 50
            height: 50
            source: "qrc:/pics/redBall.png"
            x: 670
            y: 490
            z: 2000

            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: 475
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: 490
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        Image {
            id: greenBall
            width: 50
            height: 50
            source: "qrc:/pics/greenBall.png"
            x: 150
            y: 490
            z: 2000

            SequentialAnimation on y {
                running: true
                loops: Animation.Infinite
                PropertyAnimation {
                    to: 475
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
                PropertyAnimation {
                    to: 490
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }

}


