// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {

    //startX1
    //----------->
    //endX1
    //-------------------------------->
    // startY                                               endY
    //   |                                                  |
    //   |                                                  |
    //   |                                                  |
    //  \ /          _                                      |
    //             *|_|(car)             *                  |
    //            *                       *                 |
    //           *                         *                |
    //          *                           *               |
    //         *                             *              |
    //        *                               *             |
    //       *                                 *            |
    //      *                                   *           |
    //     *                                     *         \ /
    //
    //
    //startX2
    //-->
    //endX2
    //----------------------------------------->

    property int startX1: width / 16
    property int endX1: width - width / 16

    property int startX2: 0
    property int endX2: width

    property int startY: height / 16
    property int endY: height

    property int drivenCarMove : 20

    id: main
    width: 800
    height: 480

    Rectangle {
        id: background
        color: "black"
        width: parent.width; height: parent.height
        focus: true
        Keys.onLeftPressed: { x = x - drivenCarMove }
        Keys.onRightPressed: { x = x + drivenCarMove }
    }

    Car {
        id: firstCar
        color: "red"
        offsetStartX1: startX1
        offsetEndX1: endX1
        offsetStartX2: startX2
        offsetEndX2: endX2
        offsetStartY: startY
        offsetEndY: endY
        carWidth: drivenCar.width
    }

    Rectangle {
        id: drivenCar
        color: "blue"
        width: parent.width / 4
        height: parent.height / 6
        anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
    }

    MouseArea {
        anchors.fill: parent
        onClicked: firstCar.move();
    }

//    SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        NumberAnimation { targets: [firstCar, secondCar, thirdCar, fourthCar]; properties: "newY"; to: main.height; duration: 4000 }
//    }
}
