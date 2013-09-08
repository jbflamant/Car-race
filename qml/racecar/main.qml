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

    property int stopRight: width - background.width
    property int stopLeft: 0

    id: main
    width: 1366
    height: 768

    Rectangle {
        id: background

        gradient: Gradient {
            GradientStop {position: 1.0; color: Qt.rgba(0 , .68 , .92, 1) }
            GradientStop {position: 0.5; color: Qt.rgba(0 , .68 , .92, 1)}
            GradientStop {position: 0.0; color: Qt.rgba(.18 , .20 , .56, 1) }
        }

        width: parent.width;
        anchors.top: parent.top; anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2
        focus: true
        Image {
            id: bckgrdImage

            property int originX : width / 2

            width: parent.width; height: parent.height;
            y: parent.height / 2
            smooth: true
            transform: Rotation {origin.x: bckgrdImage.originX; origin.y: 0; axis {x: 1; y: 0; z: 0} angle: 80 }
            source: "qrc:/img/straight-highway-v2.svg"
        }
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
        var nextMove = background.x + drivenCarMove;
        if(nextMove <= stopLeft) {
            background.x = background.x + drivenCarMove
            car.stop()
            car.x = car.x + drivenCarMove
            car.xPrime = car.xPrime + drivenCarMove
            car.move()
        }
        else if (background.x == stopLeft) {
            //Nothing to do
        }
        else if (nextMove > stopLeft ) {
            background.x = stopLeft;
            car.stop()
            car.x = car.x + (stopLeft - nextMove)
            car.xPrime = car.xPrime + (stopLeft - nextMove)
            car.move()
        }
    }

    Keys.onRightPressed: {
        var nextMove = background.x - drivenCarMove;
        if(nextMove >= stopRight) {
            background.x = background.x - drivenCarMove
            car.stop()
            car.x = car.x - drivenCarMove
            car.xPrime = car.xPrime - drivenCarMove
            car.move()
        }
        else if (background.x == stopRight) {
            //Nothing to do
        }
        else if (nextMove < stopRight ) {
            background.x = stopRight;
            car.stop()
            car.x = car.x - (nextMove - stopRight)
            car.xPrime = car.xPrime - (nextMove - stopRight)
            car.move()
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            car.move();
            console.log(background.width)
            console.log(background.children[0].width)
        }
    }


}
