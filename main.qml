import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 400


    Connections {
        target: appCore // Указываем целевое соединение
        onSendToQmlNameDetectedPeople:{
            textField_information.text =  name
        }

    }

    MainForm {
        anchors.fill: parent

        property int start_stop_find_face: 0
        btn_find_face.onClicked:{
            if(start_stop_find_face ==0)
            {
                //сигнал
                appCore.receiveFromQmlStartRecognationFace(comboBox_methods.currentText, textField_treshold.text)

                textField_treshold.text = sliderHorizontal_treshold.value
                btn_create_DB.enabled = false
                btn_ok.enabled = false
                btn_save.enabled = false
                textField_treshold.enabled = false
                textField_your_name.enabled = false
                comboBox_methods.enabled = false
                sliderHorizontal_treshold.enabled = false
                start_stop_find_face = 1
                textField_information.text = "Now start process recognation face! \nMethod:" + comboBox_methods.currentText
            }
            else
            {
                //Сигнал
                appCore.receiveFromQmlStopRecognationFace()

                btn_create_DB.enabled = true
                textField_treshold.enabled = true
                comboBox_methods.enabled = true
                sliderHorizontal_treshold.enabled = true
                comboBox_methods.enabled = true
                start_stop_find_face = 0
                textField_information.text = "Now stop process recognation face!"
            }
        }
        btn_create_DB.onClicked: {

            textField_information.text = "Created photo 0/10"
            btn_ok.enabled = true
            textField_your_name.enabled = true
            btn_save.enabled = false
            btn_create_DB.enabled = false
            btn_find_face.enabled = false
            textField_treshold.enabled = false
            comboBox_methods.enabled = false
            sliderHorizontal_treshold.enabled = false
            start_stop_find_face = 1
        }
        btn_ok.onClicked: {
            if(textField_your_name.text!="")
            {
                appCore.receiveFromQmlStartCreateDatabase(textField_your_name.text)//Отправка имени пользователя

                btn_save.enabled = true
                btn_ok.enabled = false
                textField_your_name.enabled = false
            }
            else{
                textField_your_name.placeholderText = "Enter your name!"
            }
        }
        property int counterPhoto: 0
        btn_save.onClicked: {
            if(counterPhoto < 9)
            {
                //сигнал
                appCore.receiveFromQmlCreatePhoto()

                counterPhoto ++
                textField_information.text = "Create " + counterPhoto + "/10 photo."
            }
            else
            {
                //сигнал
                appCore.receiveFromQmlCreatePhoto()

                counterPhoto = 0
                start_stop_find_face = 0
                btn_save.enabled = false
                btn_create_DB.enabled = true
                btn_find_face.enabled = true
                textField_information.text = "Database with user " + textField_your_name.text + " was created!"
                comboBox_methods.enabled = true
            }
        }
        sliderHorizontal_treshold.antialiasing: {
            textField_treshold.text = sliderHorizontal_treshold.value
        }
    }
}

