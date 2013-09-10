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

    property int startX1: width * .45
    property int endX1: width * .55

    property int startX2: 0
    property int endX2: width

    property int startY: height * .6 - car.height
    property int endY: height

    property int drivenCarMove : 100

    property int stopRight: width - background.width * (1 - 0.05)
    property int stopLeft: - background.width * 0.05

    property int roadStepRotation: 85

    property real roadEndRatio: 0.5

    property int roadSpeed: 3000

    id: main
    width: 1366
    height: 768

    Rectangle {
        id: background

        width: 2 * parent.width;
        anchors.top: parent.top; anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2

        focus: true

        color: "green"

        Rectangle {
            id: bckgrdImage

            property int originX : width / 2
            property int originY : 100

            width: parent.width * .75; height: 64 * parent.height;
            x: parent.width / 2 - width / 2
            y: parent.height * .7
            smooth: true
            transform: Rotation {id: backgroundRotation; origin.x: bckgrdImage.originX; origin.y: bckgrdImage.originY; axis {x: 1; y: 0; z: 0} angle: 80 }
            color: "transparent"

            Image {
                width: parent.width; height: parent.height
                y: -2*parent.height
                source: "qrc:/img/straight-highway-v2.svg"
            }
            Image {
                width: parent.width; height: parent.height
                y: -parent.height
                source: "qrc:/img/straight-highway-v2.svg"
            }

            Rectangle {
                id: newCarShadow
                width: parent.width / 3
                height: 500
                color: "black"
                opacity: .8

                y: -2000
            }

            Rectangle {
                id: newCar
                width: parent.width / 3
                height: 500
                color: "red"

                y: -3000
            }

            SequentialAnimation {
                running: true
                loops: Animation.Infinite
                ParallelAnimation {
                    NumberAnimation { target: bckgrdImage.children[0]; properties: "y"; to: -bckgrdImage.height; duration: roadSpeed }
                    NumberAnimation { target: bckgrdImage.children[1]; properties: "y"; to: 0; duration: roadSpeed }
                }
                NumberAnimation { target: bckgrdImage.children[1]; properties: "y"; to: -2*bckgrdImage.height; duration: 0 }
                ParallelAnimation {
                    NumberAnimation { target: bckgrdImage.children[1]; properties: "y"; to: -bckgrdImage.height; duration: roadSpeed }
                    NumberAnimation { target: bckgrdImage.children[0]; properties: "y"; to: 0; duration: roadSpeed }
                }
                NumberAnimation { target: bckgrdImage.children[0]; properties: "y"; to: -2*bckgrdImage.height; duration: 0 }
            }
        }

        Rectangle {
            width: parent.width; height: parent.height * .6
            anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
            gradient: Gradient {
                GradientStop {position: 1.0; color: Qt.rgba(0 , .68 , .92, 1)}
                GradientStop {position: 0.0; color: Qt.rgba(.18 , .20 , .56, 1) }
            }
        }
    }

//    Car {
//        id: car
//        color: "red"
//        offsetStartX1: startX1
//        offsetEndX1: endX1
//        offsetStartX2: startX2
//        offsetEndX2: endX2
//        offsetStartY: startY
//        offsetEndY: endY
//        carWidth: drivenCar.width
//    }

    Rectangle {
        id: drivenCar
        color: "blue"
        width: 2 * parent.width
        height: 50
        anchors.bottom: parent.bottom
        x: - width / 3
        y: 1000
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
//            car.stop()
//            car.x = car.x + drivenCarMove
//            car.xPrime = car.xPrime + drivenCarMove
//            car.move()
            bckgrdImage.originX = bckgrdImage.originX - roadStepRotation;
        }
        else if (background.x == stopLeft) {
            //Nothing to do
//            bckgrdImage.originX = 0;
        }
        else if (nextMove > stopLeft ) {
            background.x = stopLeft;
//            car.stop()
//            car.x = car.x + (stopLeft - nextMove)
//            car.xPrime = car.xPrime + (stopLeft - nextMove)
//            car.move()
//            bckgrdImage.originX = 0;
        }
        console.log("Key left")
        console.log(background.x)
    }

    Keys.onRightPressed: {
        var nextMove = background.x - drivenCarMove;
        if(nextMove >= stopRight) {
            background.x = background.x - drivenCarMove
//            car.stop()
//            car.x = car.x - drivenCarMove
//            car.xPrime = car.xPrime - drivenCarMove
//            car.move()
            bckgrdImage.originX = bckgrdImage.originX + roadStepRotation;
        }
        else if (background.x == stopRight) {
            //Nothing to do
//            bckgrdImage.originX = bckgrdImage.width;
        }
        else if (nextMove < stopRight ) {
            background.x = stopRight;
//            car.stop()
//            car.x = car.x - (nextMove - stopRight)
//            car.xPrime = car.xPrime - (nextMove - stopRight)
//            car.move()
//            bckgrdImage.originX = bckgrdImage.width;
        }
        console.log("Key right")
        console.log(background.x)
    }

}
