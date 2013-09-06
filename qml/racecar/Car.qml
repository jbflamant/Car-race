import QtQuick 1.1

Rectangle {

    //offsetStartX1
    //----------->
    //offsetEndX1
    //-------------------------------->
    //offsetStartY                                      offsetEndY
    //   |                                                  |
    //   |                delta1                            |
    //   |          <------------------->                   |
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
    //      <------------------------------------>
    //                      delta2
    //offsetStartX2
    //-->
    //offsetEndX2
    //----------------------------------------->

    id: car

    property int offsetStartX1: 0
    property int offsetEndX1: 0

    property int offsetStartX2: 0
    property int offsetEndX2: 0

    property int offsetStartY: 0
    property int offsetEndY: 0

    property int xPrime: (delta2 - width) * Math.random() + offsetStartX2
    property int yPrime: offsetEndY

    property int delta1: offsetEndX1 - offsetStartX1
    property int delta2: offsetEndX2 - offsetStartX2

    property int carWidth: 0

    property real ratio: delta1 / delta2

    property bool isMoving: false

    width: parent.width / 8
    height: parent.height / 8
    y: offsetStartY
    x: (delta1 - width) * Math.random() + offsetStartX1

    function move() {
        var roadCenter = delta2 / 2 + offsetStartX2;
        var carCenter = x + width / 2;

        console.log(ratio);

        if(carCenter < roadCenter) {
            xPrime = delta2 / 2 + offsetStartX2 - ((delta1 / 2 + offsetStartX1) - x)  / ratio;
        }
        else if(carCenter === roadCenter) {
            xPrime = x;
        }
        else {
            xPrime = x / ratio + offsetStartX2;
        }

        yPrime= offsetEndY;
        console.log(xPrime);
        isMoving = true;
    }

    ParallelAnimation {
        running: isMoving
        loops: 1
        NumberAnimation { target: car; properties: 'x'; to: xPrime; duration: 1000 }
        NumberAnimation { target: car; properties: 'y'; to: yPrime; duration: 1000 }
//        NumberAnimation { target: car; properties: 'width'; to: carWidth; duration: 1000 }
    }

}
