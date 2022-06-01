#ifndef APPSDRAWER_H
#define APPSDRAWER_H

#include <QObject>
#include <QAbstractListModel>
#include <QVector>
#include <QString>
#include <QFile>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
class AppsDrawer : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit AppsDrawer(QObject *parent = 0);

    enum ModelRoles {
        NameRole = Qt::UserRole + 1,
        LongnameRole,
        ShortnameRole,
        IconsRole,
        TypeRole,
        BrandsRole,
        EnableRole,
        AvailableRole
    };
    Q_ENUM(ModelRoles) // To expose role to QML

    struct AppEntry {
        QString name; //appId for external apps
        QString longname;
        QString shortname;
        QString icons;
        QString type;
        QString brands;
        bool enabled;
        bool available;
        // Init to default
        AppEntry()
        {
            name = "";
            longname = "";
            shortname = "";
            icons = "";
            type = "";
            brands = "";
            enabled = false;
            available = false;
        }
    };
    QList<AppEntry> m_appsList;
   Q_INVOKABLE void appLauncher(QString);
signals:

public slots:
private:
    /************************************************************************
     * Function overriding to implement QAbstractList Model
     * rowCount, data, roleName
    *************************************************************************/

        int rowCount(const QModelIndex & parent = QModelIndex()) const;
        QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    //Optional:
        bool setData(const QModelIndex &index, const QVariant &value, int role);
protected:
        QHash<int, QByteArray> roleNames() const;
        void populateAppList();
        QVector<AppEntry> getFromJson(const QString& fileName);
        AppEntry getAppItem(const QJsonValue &jvalue);
};

#endif // APPSDRAWER_H
