import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#e5ecef"

    function calcResult(ax, ay, bx, by , cx, cy) {
        let result = Math.abs(((Number(ax)-Number(cx))*(Number(by)-Number(cy))) - ((Number(bx)-Number(cx))*(Number(ay)-Number(cy))))/2
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
            id: column
            anchors.fill: parent
            //padding: 64
            spacing: 12
            Row {
                id: row1
                padding: 12
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter
                TextField {
                    id: textField_Ax
                    width:100
                    placeholderText: qsTr("Ax")
                    color: secondaryFrame.textColor
                }
                TextField {
                    id: textField_Ay
                     width:100
                    placeholderText: qsTr("Ay")
                    color: secondaryFrame.textColor
                }
            }
            Row {
                id: row2
                anchors.top: row1.bottom
                padding: 12
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter
                TextField {
                    id: textField_Bx
                    width:100
                    placeholderText: qsTr("Bx")
                    color: secondaryFrame.textColor
                }
                TextField {
                    id: textField_By
                    width:100
                    placeholderText: qsTr("By")
                    color: secondaryFrame.textColor
                }
            }
            Row {
                id: row3
                anchors.top: row2.bottom
                padding: 12
                spacing: 12
                anchors.horizontalCenter: parent.horizontalCenter
                TextField {
                    id: textField_Cx
                    width:100
                    placeholderText: qsTr("Cx")
                    color: secondaryFrame.textColor
                }
                TextField {
                    id: textField_Cy
                    width:100
                    placeholderText: qsTr("Cy")
                    color: secondaryFrame.textColor
                }
            }
            Button {
                id: submitButton
                anchors.top: row3.bottom
                width: 212
                height: 40
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                    }
                text: qsTr("Рассчитать")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    resultLabel.text = calcResult(textField_Ax.text, textField_Ay.text, textField_Bx.text, textField_By.text, textField_Cx.text, textField_Cy.text)
                }
            }
            Label {
                id: resultLabel
                padding: 12
                anchors.top: submitButton.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: secondaryFrame.textColor
            }
        }
    }
}
