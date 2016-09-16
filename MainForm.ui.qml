import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.2

Item {
    id: mainWindow


    property alias cameraImage: cameraImage
    property alias cameraCutImage: cameraCutImage
    property alias btn_create_DB: btn_create_DB
    property alias textField_your_name: textField_your_name
    property alias btn_ok: btn_ok
    property alias btn_save: btn_save
    property alias btn_find_face: btn_find_face
    property alias sliderHorizontal_treshold: sliderHorizontal_treshold
    property alias textField_treshold:  textField_treshold
    property alias comboBox_methods: comboBox_methods
    property alias textField_information: textField_information


    ColumnLayout {
        id: main_layout
        anchors.bottomMargin: 100
        anchors.leftMargin: 0
        spacing: 5
        anchors.fill: parent
        anchors.centerIn: parent
        RowLayout{
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            Layout.maximumHeight: 300
            Image
            {
                id: cameraImage
                Layout.preferredHeight: 300
                Layout.preferredWidth: 300
                Layout.maximumHeight: 300
                Layout.maximumWidth: 300
                visible: true
                source: "images/bigbrother.jpg"
            }
            Image
            {
                id: cameraCutImage
                fillMode: Image.PreserveAspectFit
                Layout.preferredHeight: 300
                Layout.preferredWidth: 300
                Layout.maximumHeight: 300
                Layout.maximumWidth: 300
                source: "images/bigbrother.jpg"
            }
        }
        RowLayout{
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            ColumnLayout {
                RowLayout{
                    Button{
                        id: btn_create_DB
                        text: "Create DB"
                        activeFocusOnPress: true
                    }
                    TextField {
                        id: textField_your_name
                        placeholderText: qsTr("Your name")
                        enabled: false
                    }
                    Button{
                        id: btn_ok
                        text: "Ok"
                        activeFocusOnPress: true
                        enabled: false
                    }
                    Button{
                        id: btn_save
                        text: "Save"
                        activeFocusOnPress: true
                        enabled: false
                    }

                }
                RowLayout{
                    Button{
                        id: btn_find_face
                        text: "find_face"
                        activeFocusOnPress: true
                    }
                    Slider {
                        id: sliderHorizontal_treshold
                        minimumValue: 0
                        maximumValue: 5000
                        stepSize: 100


                    }
                    Label {
                        id: textField_treshold
                        text: qsTr("Treshold value")
                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    Label {
                        text: qsTr("Select method for recognition face: ")
                    }
                    ComboBox {
                        id: comboBox_methods
                        enabled: true
                        width: 200
                        visible: true
                        Layout.fillWidth: false
                        activeFocusOnPress: true
                        model: [ "Eigenfaces", "Fisherfaces", "Local Binary Patterns Histograms" ]
                    }
                }
            }
            ColumnLayout {
                Layout.preferredWidth: 300
                Layout.minimumWidth: 300
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Label {
                    id: textField_information
                    text: qsTr("information")
                }
            }
        }
    }
}
