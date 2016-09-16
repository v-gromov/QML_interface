#include "gui_qml.h"

GUI_QML::GUI_QML(QObject *parent) : QObject(parent)
{
}

void GUI_QML::receiveFromQmlStartCreateDatabase(QString namepeople)
{
    qDebug()<<"Now started create database. Name people:  "<< namepeople;
}

void GUI_QML::receiveFromQmlStopCreateDatabase()
{
    qDebug()<<"Now stopped create database!";
}

void GUI_QML::receiveFromQmlStartRecognationFace(QString method, int treshold)
{
    qDebug()<<"Now start recognation face! Method: "<<method<<" Treshold: "<<treshold;
}

void GUI_QML::receiveFromQmlStopRecognationFace()
{
    qDebug()<<"Now stopped process recognation face!";
}

void GUI_QML::receiveFromQmlCreatePhoto()
{
    qDebug()<<"Now created photo!";
}
