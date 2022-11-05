import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 720
    visible: true
    title: qsTr("MeetMe")
    color: "#e5ecef"

    function calcResult() {
        if ((textField_A.text.length != 0) &&
            (textField_D.text.length != 0) &&
            (textField_F.text.length != 0) &&
            (textField_F.text.length != 0) &&
            (comboBoxSex.opacity != 0.5)   &&
            (comboBoxEduc.opacity != 0.5)  &&
            (comboBoxGenderSearch.opacity != 0.5))
        {

            console.log("Данные регистрации: ")
            console.log(textField_A.placeholderText + ": " + textField_A.text)
            console.log("Пол: " + comboBoxSex.currentText)
            console.log(resultYearsOld.text)
            console.log(textField_D.placeholderText + ": " + textField_D.text)
            console.log("Образование: " + comboBoxSex.currentText)
            console.log(textField_F.placeholderText + ": " + textField_F.text)
            console.log(textField_G.placeholderText + ": " + textField_G.text)
            console.log(searchLabel.text)
            console.log("Пол: " + comboBoxGenderSearch.currentText)
            console.log(searchYearsLabel.text)

        }



    }

    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent
        radius: 15
        width: 300
        height: 700

        property string textColor: "#535353"
        Column {
            anchors.fill: parent
            padding: 45
            spacing: 12
            Label {
                id: profileLabel
                anchors.horizontalCenter: parent.horizontalCenter
                color: secondaryFrame.textColor
                text:  qsTr("Личные данные:");
            }
            TextField {
                id: textField_A
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Имя")
                color: secondaryFrame.textColor
            }

            ComboBox {
                id: comboBoxSex
                background: Rectangle {
                    id: recSex
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "white")
                    border.color: "gray"
                    }
                displayText: qsTr("Пол")
                anchors.horizontalCenter: parent.horizontalCenter
                width: textField_A.width
                height: textField_A.height
                model: ["Мужчина", "Женщина"]
                opacity: 0.5
                onActivated: {
                    comboBoxSex.displayText = currentText
                    comboBoxSex.opacity = 1
                    recSex.opacity = 0.5
                }
            }

            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                Label {
                    id: resultYearsOld
                    text: qsTr("Возраст: ") + yearsSlider.value
                    width: textField_A.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: secondaryFrame.textColor
                }
                Slider {
                    id: yearsSlider
                    from: 16
                    value: 22
                    stepSize: 1
                    to: 80
                    snapMode: "SnapAlways"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }

            TextField {
                id: textField_D
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Город")
                color: secondaryFrame.textColor
            }

            ComboBox {
                id: comboBoxEduc
                background: Rectangle {
                    id: recEduc
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "white")
                    border.color: "gray"
                    }
                font: textField_A.font
                displayText: qsTr("Образование")
                anchors.horizontalCenter: parent.horizontalCenter
                width: textField_A.width
                height: textField_A.height
                model: ["Начальное", "Среднее", "Среднее специальное", "Высшее"]                
                opacity: 0.5
                onActivated: {
                    comboBoxEduc.displayText = currentText
                    comboBoxEduc.opacity = 1
                    recEduc.opacity = 0.5
                }
            }
            TextField {
                id: textField_F
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Хобби")
                color: secondaryFrame.textColor
            }

            TextField {
                id: textField_G
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("О себе")
                height: textField_A.height * 2
                color: secondaryFrame.textColor
            }

            Label {
                id: searchLabel
                anchors.horizontalCenter: parent.horizontalCenter
                color: secondaryFrame.textColor
                text:  qsTr("Параметры для поиска:");
            }

            ComboBox {
                id: comboBoxGenderSearch
                background: Rectangle {
                    id: recGenSearch
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "white")
                    border.color: "gray"
                    }
                displayText: qsTr("Пол")
                anchors.horizontalCenter: parent.horizontalCenter
                width: textField_A.width
                height: textField_A.height
                model: ["Мужчина", "Женщина"]                
                opacity: 0.5
                onActivated: {
                    comboBoxGenderSearch.displayText = currentText
                    comboBoxGenderSearch.opacity = 1
                    recGenSearch.opacity = 0.5
                }
            }
            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                Label {
                    id: searchYearsLabel
                    text: qsTr("Возраст: от ") + searchYears.first.value + qsTr(" до ") + searchYears.second.value
                    width: textField_A.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: secondaryFrame.textColor
                }

                RangeSlider {
                    id: searchYears
                    from: yearsSlider.from
                    to: yearsSlider.to
                    first.value: yearsSlider.value - 5
                    second.value: yearsSlider.value + 15
                    stepSize: 1
                    snapMode: "SnapAlways"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }


            Button {
                id: registerButton
                width: 200
                height: 40
                background: Rectangle {
                    color: parent.down ? "#f86368" :
                    (parent.hovered ? "#ff8085" : "#ffabaf")
                    radius: 25
                    }
                text: qsTr("Регистрация")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    calcResult()
                }
            }
        }
    }
}
