#ifndef GUI_QML_H
#define GUI_QML_H

#include <QObject>
#include <QDebug>
#include <QString>

class GUI_QML : public QObject
{
    Q_OBJECT
public:
    explicit GUI_QML(QObject *parent = 0);
signals:
    // Сигнал для передачи данных в qml-интерфейс
    void sendToQmlNameDetectedPeople(QString name);
    //void sendToQmlStopCreatedDatabase();
public slots:
    void receiveFromQmlStartCreateDatabase(QString);
    void receiveFromQmlStopCreateDatabase();
    void receiveFromQmlStartRecognationFace(QString, int);
    void receiveFromQmlStopRecognationFace();
    void receiveFromQmlCreatePhoto();

};

#endif // GUI_QML_H
