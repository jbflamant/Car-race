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

    property int stopLeft: width - background.width
    property int stopRight: 0

    id: main
    width: 800
    height: 480

    Rectangle {
        id: background
        color: "black"
        width: parent.width + 200; height: parent.height
        x: -100
        focus: true

    }

    Car {
        id: car
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
        width: parent.width
        height: parent.height / 6
        anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
        radius: width / 2
    }

 //*******************************************//
 //                                           //
 //         MOVEMENT MANAGEMENT SECTION       //
 //                                           //
 //                                           //
 //*******************************************//

    Keys.onLeftPressed: {
        var nextMove = background.x - drivenCarMove;
        if(nextMove >= stopLeft) {
            background.x = background.x - drivenCarMove

            car.stop()
            car.x = car.x + drivenCarMove
            car.xPrime = car.xPrime + drivenCarMove
            car.move()
        }
        else if (background.x == stopLeft) {
            //Nothing to do
        }
        else if (nextMove < stopLeft ) {
            background.x = stopLeft;
            car.stop()
            car.x = car.x + (stopLeft - nextMove)
            car.xPrime = car.xPrime + (stopLeft - nextMove)
            car.move()
        }
        console.log(background.x)
    }

    Keys.onRightPressed: {
        var nextMove = background.x + drivenCarMove;
        if(nextMove <= stopRight) {
            background.x = background.x + drivenCarMove
            car.stop()
            car.x = car.x - drivenCarMove
            car.xPrime = car.xPrime - drivenCarMove
            car.move()
        }
        else if (background.x == stopRight) {
            //Nothing to do
        }
        else if (nextMove > stopRight ) {
            background.x = stopRight;
            car.stop()
            car.x = car.x - (nextMove - stopRight)
            car.xPrime = car.xPrime - (nextMove - stopRight)
            car.move()
        }
        console.log(background.x)
    }

    MouseArea {
        anchors.fill: parent
        onClicked: car.move();
    }


}
