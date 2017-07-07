#ifndef APP_H
#define APP_H

#include <QObject>
#include <QVariant>

class App : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString name READ name)
    Q_PROPERTY(QString icon READ icon)

public:
    App(QObject* parent = 0);
    ~App();
    QString name() const;
    QString icon() const;

    void setName(const QString &name);
    void setIcon(const QString &icon);

private :
    QString m_name;
    QString m_icon;
};

#endif // APP_H
