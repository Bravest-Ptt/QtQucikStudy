#include <QGuiApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/qml/xml_display.qml")));
    view.show();

    //Application main event looper
    return app.exec();
}

//show application with QQmlApplicationEngine and you can control your app totally in qml
//int main(int argc, char *argv[])
//{
//    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/window/window_exercise.qml")));

//    //Application main event looper
//    return app.exec();
//}
