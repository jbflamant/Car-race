// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {

    id: main
    width: 360
    height: 360

    Car {
        id: firstCar
        color: "red"
    }

    Car {
        id: secondCar
        color: "green"
    }

    Car {
        id: thirdCar
        color: "yellow"
    }

    Car {
        id: fourthCar
        color: "grey"
    }

    Rectangle {
        id: driver
        color: "blue"
        width: parent.width / 4
        height: parent.height / 6
        anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        NumberAnimation { targets: [firstCar, secondCar, thirdCar, fourthCar]; properties: "newY"; to: main.height; duration: 4000 }
    }
}
