#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "MainWindow.h"
#include <QFontDatabase>
//#include <QtCore/private/qandroidextras_p.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

 /*---------------add func to qml-----------*/
    MainWindow mainwindow;

    engine.rootContext()->setContextProperty("mainwindow", &mainwindow);

 /*------------------------------------*/

    engine.loadFromModule("calc_salary", "Main");

    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Error: Failed to load QML root objects.";
        return -1;}


    return app.exec();
}
