#include "app.h"


App::App(QObject *parent)
    :QObject(parent)
{

}

App::~App()
{
}

QString App::name() const
{
    return m_name;
}

QString App::icon() const
{
    return m_icon;
}

void App::setIcon(const QString &icon)
{
    m_icon = icon;
}

void App::setName(const QString &name)
{
    m_name = name;
}
