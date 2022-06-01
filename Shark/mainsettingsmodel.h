#ifndef MAINSETTINGSMODEL_H
#define MAINSETTINGSMODEL_H

#include <QObject>
#include <QAbstractListModel>

class MainSettingsModel  : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MainSettingsModel(QObject *parent = nullptr);
    enum ModelRoles {
        NameRole = Qt::UserRole + 1,
        LongnameRole,
        ShortnameRole,
        IconsRole,
        TypeRole,
        PathRole,
        MoreRole,
        EnableRole,
        AvailableRole
    };
    Q_ENUM(ModelRoles) // To expose role to QML
    struct SettingsList {
        QString name; //appId for external apps
        QString longname;
        QString shortname;
        QString icons;
        QString type;
        QString path;
        bool ismore;
        bool isenabled;
        bool isavailable;
        // Init to default
        SettingsList()
        {
            name = "";
            longname = "";
            shortname = "";
            icons = "";
            type = "";
            path = "";
            ismore = false;
            isenabled = false;
            isavailable = false;
        }
        SettingsList(QString aname,QString alongname,QString ashortname,QString aicons,QString atype,QString apath,bool aismore,bool aisenabled,bool aisavailable)
        {
            name = aname;
            longname = alongname;
            shortname = ashortname;
            icons = aicons;
            type = atype;
            path = apath;
            ismore = aismore;
            isenabled = aisenabled;
            isavailable = aisavailable;
        }
    };
    QList<SettingsList> m_List;
    Q_INVOKABLE QString getPath(int);
signals:
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
};

#endif // MAINSETTINGSMODEL_H
