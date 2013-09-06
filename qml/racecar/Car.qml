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

    property int delta1: offsetEndX1 - offsetStartX1
    property int delta2: offsetEndX2 - offsetStartX2

    property bool isMoving: false

    width: parent.width / 8
    height: parent.height / 8
    y: offsetStartY
    x: (delta1 - width) * Math.random() + offsetStartX1

    function move() {
        isMoving = true;
    }

    ParallelAnimation {
        running: isMoving
        loops: 1
        NumberAnimation { target: car; properties: 'x'; to: offsetEndX2; duration: 1000 }
        NumberAnimation { target: car; properties: 'y'; to: offsetEndY; duration: 1000 }
    }

}
