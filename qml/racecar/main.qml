// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {

    property int startX: width / 16
    property int endX: width - width / 16

    property int startY: height / 16
    property int endY: height

    id: main
    width: 360
    height: 360

    Car {
        id: firstCar
        color: "red"
        offsetStartXY1: startX
        offsetEndXY1: endX
        offsetStartY: startY
        offsetEndY: endY
    }

    Car {
        id: secondCar
        color: "green"
        offsetStartXY1: startX
        offsetEndXY1: endX
        offsetStartY: startY
        offsetEndY: endY
    }

    Car {
        id: thirdCar
        color: "yellow"
        offsetStartXY1: startX
        offsetEndXY1: endX
        offsetStartY: startY
        offsetEndY: endY
    }

    Car {
        id: fourthCar
        color: "grey"
        offsetStartXY1: startX
        offsetEndXY1: endX
        offsetStartY: startY
        offsetEndY: endY
    }

    Rectangle {
        id: driver
        color: "blue"
        width: parent.width / 4
        height: parent.height / 6
        anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
    }

//    SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        NumberAnimation { targets: [firstCar, secondCar, thirdCar, fourthCar]; properties: "newY"; to: main.height; duration: 4000 }
//    }
}
