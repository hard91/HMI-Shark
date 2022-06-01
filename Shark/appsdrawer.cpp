#include "appsdrawer.h"
#include <QDebug>

AppsDrawer::AppsDrawer(QObject *parent) : QAbstractListModel(parent)
{
    qDebug() <<"Component created";
    populateAppList();
}

void AppsDrawer::appLauncher(QString app)
{
    qDebug() <<"Triggered from QML"<<app;
}

int AppsDrawer::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
return m_appsList.count();
}

QVariant AppsDrawer::data(const QModelIndex &index, int role) const
{
    int row = index.row();

    if (row < 0 || row >= m_appsList.count())
        return QVariant();

    switch(role)
    {
    case NameRole:
        return m_appsList[row].name;
    case LongnameRole:
        return m_appsList[row].longname;
    case ShortnameRole:
        return m_appsList[row].shortname;
    case IconsRole:
        return m_appsList[row].icons;
    case TypeRole:
        return m_appsList[row].type;
    case BrandsRole:
        return m_appsList[row].brands;
    case EnableRole:
        return m_appsList[row].enabled;
    case AvailableRole:
        qDebug() << "Available " <<m_appsList[row].available;
        return m_appsList[row].available;
    default:
        return QVariant();
    }
}

bool AppsDrawer::setData(const QModelIndex &index, const QVariant &value, int role)
{
    AppEntry& item = m_appsList[index.row()];
    bool somethingChanged = false;

    switch (role) {
    case EnableRole:
    {
        if( item.enabled != value.toBool()){
            qDebug() << "Changing enabled for " << item.name;
            item.enabled = value.toBool();
            somethingChanged = true;
        }
        break;
    }

    }

    if( somethingChanged){
        emit dataChanged(index,index,QVector<int>() << role); // only specific changed role will be updated
        return true;
    }
    return false;
}

QHash<int, QByteArray> AppsDrawer::roleNames() const
{
    QHash<int, QByteArray> myroles;

    myroles[NameRole]       = "qml_name";
    myroles[LongnameRole]   = "qml_longName";
    myroles[ShortnameRole]  = "qml_shortName";
    myroles[IconsRole]      = "qml_icon";
    myroles[TypeRole]       = "qml_type";
    myroles[BrandsRole]     = "qml_brandName";
    myroles[EnableRole]     = "qml_isEnable";
    myroles[AvailableRole]  = "qml_isAvailable";

    return myroles;
}

void AppsDrawer::populateAppList()
{
    QVector<AppEntry> appList;
        appList = getFromJson(":/res/assets/full_apps.json");

        qDebug() <<"Apps drawer app count : "<<appList.count();
        m_appsList = appList.toList();  // convert vector to List

//        for(int i = 0; i < m_appsList.count();) {
//           if (m_appsList[i].name.compare("invalid", Qt::CaseInsensitive) == 0) {
//                m_appsList.removeAt(i);
//            } else {
//                i++;
//            }
//        }
}

QVector<AppsDrawer::AppEntry> AppsDrawer::getFromJson(const QString &fileName)
{
    QVector<AppEntry> apps;

      QFile file(fileName);
      if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
           qDebug() <<"Cannot open file : " << fileName;
      }
      else
      {
          QJsonDocument json = QJsonDocument::fromJson(file.readAll());
          if (!json.isNull() && json.isArray())
          {
              QJsonArray appsList =json.array();
              foreach (QJsonValue jvalue, appsList) {
                  apps.append(getAppItem(jvalue));
              }
          }
          else {
               qDebug() << "Empty app list";
          }
      }

      return apps;
}

AppsDrawer::AppEntry AppsDrawer::getAppItem(const QJsonValue &jvalue)
{
    AppEntry item;

        if (!jvalue.isNull() && jvalue.isObject()) {
            QJsonObject jobject = jvalue.toObject();

            item.name = jobject["name"].toString();
            item.longname = jobject["longname"].toString();
            item.shortname = jobject["shortname"].toString();
            item.icons = jobject["icons"].toString();
            item.type = jobject["type"].toString();
            item.brands = jobject["brands"].toString();
            item.enabled = jobject["enabled"].toBool();
            item.available = jobject["available"].toBool();
        }
        else {
             qDebug() << "AppItem is not json object";
        }

        return item;
}
