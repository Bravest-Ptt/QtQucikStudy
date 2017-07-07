#include "applistmodel.h"
#include "app.h"
#include <limits.h>
#include <QXmlStreamReader>
#include <QFile>
#include <QDebug>
#include <QTime>
#include <QDebug>

class AppListModelPrivate
{
public:
    QString m_strXmlFile;
    QString m_strError;
    bool m_bError;
    QHash<int, QByteArray> m_roleNames;
    QVector<App*> m_apps;

    AppListModelPrivate()
        : m_bError(false)
    {
    }

    ~AppListModelPrivate()
    {
        clear();
    }

    void load()
    {
        QTime q;
        q.restart();

        QXmlStreamReader reader;
        QFile file(m_strXmlFile);
        if(!file.exists())
        {
            m_bError = true;
            m_strError = file.errorString();
            return;
        }

        if(!file.open(QFile::ReadOnly))
        {
            m_bError = true;
            m_strError = file.errorString();
            return;
        }

        reader.setDevice(&file);
        QStringRef elementName;
        App *app;

        while (!reader.atEnd())
        {
            reader.readNext();

            if(reader.isStartElement())
            {
                elementName = reader.name();
                if(elementName == "app")
                {
                    app = new App();
                }
                else if (elementName == "name")
                {
                    app->setName(reader.readElementText());
                }
                else if(elementName == "icon")
                {
                    app->setIcon(reader.readElementText());
                }
            }
            else if(reader.isEndElement())
            {
                elementName = reader.name();
                if( elementName == "app" )
                {
                    m_apps.append(app);
                    app = NULL;
                }
            }
        }
        file.close();
        if(reader.hasError())
        {
            m_bError = true;
            m_strError = reader.errorString();
        }
        qDebug("load data time = %d", q.elapsed());
    }

    void reset()
    {
        m_bError = false;
        m_strError.clear();
        clear();
    }

    void clear()
    {
        int count = m_apps.size();
        if(count > 0)
        {
            for(int i = 0; i < count; i++)
            {
                delete m_apps.at(i);
            }
            m_apps.clear();
        }
    }
};

AppListModel::AppListModel(QObject *parent)
    : QAbstractListModel(parent)
    , m_dptr(new AppListModelPrivate)
{
}

AppListModel::~AppListModel()
{
    delete m_dptr;
}

int AppListModel::rowCount(const QModelIndex &parent) const
{
    return m_dptr->m_apps.size();
}

QVariant AppListModel::data(const QModelIndex &index, int role) const
{
    App *d = m_dptr->m_apps[index.row()];
    //qDebug() << "role = " << role;
    if(role == NameRole)
    {
        return d->name();
    }
    else if(role == IconRole)
    {
        return d->icon();
    }

    return QVariant();
    //return d->at(role - Qt::UserRole);
}

QHash<int, QByteArray> AppListModel::roleNames() const
{
    m_dptr->m_roleNames[NameRole] = "name";
    m_dptr->m_roleNames[IconRole] = "icon";
    return m_dptr->m_roleNames;
}

QString AppListModel::source() const
{
    return m_dptr->m_strXmlFile;
}

void AppListModel::setSource(const QString &filePath)
{
    qDebug() << "setSource = " << filePath;
    m_dptr->m_strXmlFile = filePath;
    reload();
    if(m_dptr->m_bError)
    {
        qDebug() << "AppListModel, error - " << m_dptr->m_strError;
    }
}

QString AppListModel::errorString() const
{
    return m_dptr->m_strError;
}

bool AppListModel::hasError() const
{
    return m_dptr->m_bError;
}

void AppListModel::reload()
{
    beginResetModel();
    m_dptr->reset();
    m_dptr->load();
    endResetModel();
}

void AppListModel::remove(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    delete m_dptr->m_apps.takeAt(index);
    endRemoveRows();
}

App* AppListModel::get(int index)
{
    return m_dptr->m_apps.at(index);
}

void AppListModel::append(App *app)
{
    m_dptr->m_apps.append(app);
}

