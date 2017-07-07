#ifndef APPLISTMODEL_H
#define APPLISTMODEL_H
#include <QAbstractListModel>
#include <QVector>
#include "app.h"
typedef QVector<QString> AppData;

class AppListModelPrivate;
class AppListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource)

public:
    enum AppRoles {
        NameRole = Qt::UserRole + 1,
        IconRole
    };

    AppListModel(QObject *parent = 0);
    ~AppListModel();

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

    QHash<int, QByteArray> roleNames() const;
    QString source() const;
    void setSource(const QString& filePath);

    Q_INVOKABLE QString errorString() const;
    Q_INVOKABLE bool hasError() const;
    Q_INVOKABLE void reload();
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE App* get(int index);
    Q_INVOKABLE void append(App* app);
private:
    AppListModelPrivate *m_dptr;
};
#endif // APPLISTMODEL_H
