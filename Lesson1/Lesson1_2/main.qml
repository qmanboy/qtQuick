import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#e5ecef"

    function calcResult(a, b , c) {
        let p = (Number(a)+ Number(b) + Number(c))/2
        let result = Math.sqrt(p*(p-Number(a))*(p-Number(b))*(p-Number(c)))
        return result.toFixed(1);
    }

    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent
        radius: 15
        width: 300
        height: 350

        property string textColor: "#535353"
        Column {
            anchors.fill: parent
            padding: 64
            spacing: 12
            TextField {
                id: textField_A
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("a")
                color: secondaryFrame.textColor
            }
            TextField {
                id: textField_B
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("b")
                color: secondaryFrame.textColor
            }
            TextField {
                id: textField_C
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("c")
                color: secondaryFrame.textColor
            }
            Button {
                id: submitButton
                width: 200
                height: 40
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                    }
                text: qsTr("Рассчитать")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    resultLabel.text = calcResult(textField_A.text, textField_B.text, textField_C.text)
                }
            }
            Label {
                id: resultLabel
                anchors.horizontalCenter: parent.horizontalCenter
                color: secondaryFrame.textColor
            }
        }
    }
}
