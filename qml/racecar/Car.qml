import QtQuick 1.1

Rectangle {

    property real newY: 0

    property int offsetX: Math.random() * ( parent.width - 2 * parent.height / 16 - width ) + parent.height / 16
    property int offsetY: parent.height / 16

    width: parent.width / 8
    height: parent.height / 8
    y: offsetY + newY
    x: offsetX

    onYChanged:
        if (x < (parent.width / 2)) {
//            x--;
            x = (y - offsetX) * offsetX / ( offsetY - offsetX)
        }
        else {
            x++;
        }
}
