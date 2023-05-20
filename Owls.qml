import QtQuick 2.15

Item {
    id: root
    property alias animatedOwl: animatedOwl

Image {
    id: animatedOwl
    width: 50
    height: 50
    visible: false
    x: 0
    y: 0
    source: "qrc:/pics/owl1.png"


    SequentialAnimation on x {
        loops: Animation.Infinite
        PropertyAnimation { to: 800; duration: 2000 }
        PropertyAnimation { to: 400; duration: 2000 }
        PropertyAnimation { to: 800; duration: 2000 }
        PropertyAnimation { to: 0; duration: 2000 }
        PropertyAnimation { to: 500; duration: 2000 }
        PropertyAnimation { to: 100; duration: 2000 }
    }

    SequentialAnimation on y {
        loops: Animation.Infinite
        PropertyAnimation { to: 500; duration: 2000 }
        PropertyAnimation { to: 600; duration: 2000 }
        PropertyAnimation { to: 200; duration: 2000 }
        PropertyAnimation { to: 500; duration: 2000 }
        PropertyAnimation { to: 100; duration: 2000 }
        PropertyAnimation { to: 0; duration: 2000 }
    }

    property var images: ["qrc:/pics/owl1.png", "qrc:/pics/owl2.png", "qrc:/pics/owl3.png"]
    property int currentImageIndex: 0

    Timer {
        id: animationTimer
        interval: 400
        running: true
        repeat: true
        onTriggered: {
            animatedOwl.currentImageIndex = (animatedOwl.currentImageIndex + 1) % animatedOwl.images.length
        }
    }

    onCurrentImageIndexChanged: {
        source = images[currentImageIndex];
    }
}
}
