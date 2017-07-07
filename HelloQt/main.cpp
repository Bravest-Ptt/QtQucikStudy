#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <applistmodel.h>
#include <QTime>
#include <QDebug>

//show application with QQmlApplicationEngine and you can control your app totally in qml
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<AppListModel>("AppListModel", 1, 0, "AppListModel");
    qmlRegisterType<App>("AppListModel", 1, 0, "App");

    QQmlApplicationEngine engine;

    QTime q;
    q.restart();
    engine.load(QUrl(QStringLiteral("qrc:/launcher/test.qml")));
    qDebug(" load main page time = %d", q.elapsed()) ;

    //Application main event looper
    return app.exec();
}
