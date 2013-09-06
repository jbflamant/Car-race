import QtQuick 1.1

Rectangle {

    //offsetStartXY1
    //----------->
    //offsetEndXY1
    //-------------------------------->
    //                    Delta1
    //            <------------------->
    //             _
    //           *|_|                  *
    //          *                       *
    //         *                         *
    //        *                           *
    //       *                             *
    //      *                               *
    //     *                                 *
    //    *                                   *
    //   *                                     *
    //    <------------------------------------>
    //                    Delta2
    //offsetStartXY2
    //-->
    //offsetEndXY2
    //----------------------------------------->


    property real newY: 0

    property int offsetStartXY1: 0
    property int offsetEndXY1: 0

    property int offsetStartXY2: 0
    property int offsetEndXY2: 0

    property int offsetX: Math.random() * ( parent.width - 2 * parent.height / 16 - width ) + parent.height / 16
    property int offsetY: parent.height / 16

    property real pente: 0

    width: parent.width / 8
    height: parent.height / 8
    y: offsetY + newY
    x: offsetX

    onYChanged:
        if (x < (parent.width / 2)) {
//            x--;
            x = (y - parent.height) * offsetX / ( offsetY - parent.height)
        }
        else {
            x++;
        }
}
