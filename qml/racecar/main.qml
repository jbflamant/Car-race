// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: main
    width: 360
    height: 360
    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    Rectangle {
        id: firstCar
        color: "red"
        width: parent.width / 8; height: parent.height / 8;
    }

    Rectangle {
        id: secondCar
        color: "green"
        width: parent.width / 8; height: parent.height / 8;
    }

    Rectangle {
        id: thirdCar
        color: "yellow"
        width: parent.width / 8; height: parent.height / 8;
    }

    Rectangle {
        id: fourthCar
        color: "grey"
        width: parent.width / 8; height: parent.height / 8;
    }

    Rectangle {
        id: driver
        color: "blue"
        width: parent.width / 4
        height: parent.height / 6
        anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
    }
}
