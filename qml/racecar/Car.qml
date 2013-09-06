import QtQuick 1.1

Rectangle {

    //offsetStartXY1
    //----------->
    //offsetEndXY1
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
    //offsetStartXY2
    //-->
    //offsetEndXY2
    //----------------------------------------->

    property int offsetStartXY1: 0
    property int offsetEndXY1: 0

    property int offsetStartXY2: 0
    property int offsetEndXY2: 0

    property int offsetStartY: 0
    property int offsetEndY: 0

    property int delta1: offsetEndXY1 - offsetStartXY1
    property int delta2: offsetEndXY2 - offsetStartXY2

    width: parent.width / 8
    height: parent.height / 8
    y: offsetStartY
    x: (delta1 - width) * Math.random() + offsetStartXY1

//    onYChanged:
//        if (x < (parent.width / 2)) {
////            x--;
//            x = (y - parent.height) * offsetX / ( offsetY - parent.height)
//        }
//        else {
//            x++;
//        }
}
