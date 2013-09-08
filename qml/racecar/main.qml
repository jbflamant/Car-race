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

    property int drivenCarMove : 100

    property int stopRight: width - background.width * (1 - 0.1)
    property int stopLeft: - background.width * 0.10

    property int roadStepRotation: 100

    property real roadEndRatio: 0.5

    id: main
    width: 1366
    height: 768

    Rectangle {
        id: background

        width: 2 * parent.width;
        anchors.top: parent.top; anchors.bottom: parent.bottom
        x: parent.width / 2 - width / 2

        focus: true

        gradient: Gradient {
            GradientStop {position: 1.0; color: "green" }
            GradientStop {position: 0.51; color: "green" }
            GradientStop {position: 0.5; color: Qt.rgba(0 , .68 , .92, 1)}
            GradientStop {position: 0.0; color: Qt.rgba(.18 , .20 , .56, 1) }
        }

        Image {
            id: bckgrdImage

            property int originX : width / 2

            width: parent.width / 2; height: parent.height;
            x: parent.width / 2 - width / 2
            y: parent.height / 2
            smooth: true
            transform: Rotation {id: backgroundRotation; origin.x: bckgrdImage.originX; origin.y: 0; axis {x: 1; y: 0; z: 0} angle: 85 }
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
            bckgrdImage.originX = bckgrdImage.originX - roadStepRotation;
        }
        else if (background.x == stopLeft) {
            //Nothing to do
//            bckgrdImage.originX = 0;
        }
        else if (nextMove > stopLeft ) {
            background.x = stopLeft;
            car.stop()
            car.x = car.x + (stopLeft - nextMove)
            car.xPrime = car.xPrime + (stopLeft - nextMove)
            car.move()
//            bckgrdImage.originX = 0;
        }
        console.log("Key left")
        console.log(background.x)
    }

    Keys.onRightPressed: {
        var nextMove = background.x - drivenCarMove;
        if(nextMove >= stopRight) {
            background.x = background.x - drivenCarMove
            car.stop()
            car.x = car.x - drivenCarMove
            car.xPrime = car.xPrime - drivenCarMove
            car.move()
            bckgrdImage.originX = bckgrdImage.originX + roadStepRotation;
        }
        else if (background.x == stopRight) {
            //Nothing to do
//            bckgrdImage.originX = bckgrdImage.width;
        }
        else if (nextMove < stopRight ) {
            background.x = stopRight;
            car.stop()
            car.x = car.x - (nextMove - stopRight)
            car.xPrime = car.xPrime - (nextMove - stopRight)
            car.move()
//            bckgrdImage.originX = bckgrdImage.width;
        }
        console.log("Key right")
        console.log(background.x)
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
