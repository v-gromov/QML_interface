#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "gui_qml.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine; //Движок QML

    GUI_QML appCore; //ядро приложения
    QQmlContext *context = engine.rootContext();    // Создаём корневой контекст
    context->setContextProperty("appCore", &appCore);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
