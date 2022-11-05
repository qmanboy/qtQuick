import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: main
    width: 640
    height: 480
    visible: true
    title: qsTr("Lesson2_2/3")

    Rectangle {
        id: mainRec
        width: main.width/4
        height: main.width/4
        anchors.centerIn: parent
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
        radius: 0

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton

            onClicked: {
                    mainRec.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            }
            onDoubleClicked: {
                radiusAnim.start()
            }
        }
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.RightButton

            onClicked: {
                rotationAnim.start()
            }
        }
    }

    PropertyAnimation {
        id: radiusAnim
        target: mainRec
        property: "radius"
        from: mainRec.radius
        to: mainRec.width/2
        duration: 300
    }

    PropertyAnimation {
        id: rotationAnim
        target: mainRec
        property: "rotation"
        from: 0
        to: 360
        duration: 500
    }

}
