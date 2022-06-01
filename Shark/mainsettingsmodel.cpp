#include "mainsettingsmodel.h"
#include <QDebug>

MainSettingsModel::MainSettingsModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_List.emplace_back("about",        "About",            "Ab..", "qrc:/res/assets/settings_assets/about.png",        "Categroy","settings_about.qml",        false,  true,   true);
    m_List.emplace_back("connectivity", "Connectivity",     "Co..", "qrc:/res/assets/settings_assets/connectivity.png", "Categroy","settings_connectivity.qml", true,  true,   true);
    m_List.emplace_back("general",      "General",          "Ge..", "qrc:/res/assets/settings_assets/general.png",      "Categroy","settings_general.qml",      true,  true,   true);
    m_List.emplace_back("display",      "Display",          "Di..", "qrc:/res/assets/settings_assets/display.png",      "Categroy","settings_display.qml",      false,  true,   true);
    m_List.emplace_back("clock",        "Clock",            "Cl..", "qrc:/res/assets/settings_assets/clock.png",        "Categroy","settings_clock.qml",        false,  true,   true);
    m_List.emplace_back("sound",        "Sound",            "So..", "qrc:/res/assets/settings_assets/sound.png",        "Categroy","settings_sound.qml",        false,  true,   true);
    m_List.emplace_back("phone",        "Phone",            "Ph..", "qrc:/res/assets/settings_assets/phone.png",        "Categroy","settings_phone.qml",        false,  true,   true);
    m_List.emplace_back("ambientlight", "Ambientlight",     "Am..", "qrc:/res/assets/settings_assets/ambientlight.png", "Categroy","settings_ambientlight.qml", false,  true,   true);
    m_List.emplace_back("camera",       "Camera",           "Ca..", "qrc:/res/assets/settings_assets/camera.png",       "Categroy","settings_camera.qml",       false,  true,   true);
    m_List.emplace_back("vehicle",      "Vehicle",          "Ve..", "qrc:/res/assets/settings_assets/car.png",          "Categroy","settings_car.qml",          false,  true,   true);
    m_List.emplace_back("voice",        "Voice",            "Vo..", "qrc:/res/assets/settings_assets/voice.png",        "Categroy","settings_voice.qml",        false,  true,   true);
}

QString MainSettingsModel::getPath(int index)
{
return m_List.at(index).path;
}

int MainSettingsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
return m_List.count();
}

QVariant MainSettingsModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();

    if (row < 0 || row >= m_List.count())
        return QVariant();

    switch(role)
    {
    case NameRole:
        return m_List[row].name;
    case LongnameRole:
        return m_List[row].longname;
    case ShortnameRole:
        return m_List[row].shortname;
    case IconsRole:
        return m_List[row].icons;
    case TypeRole:
        return m_List[row].type;
    case PathRole:
        return m_List[row].path;
    case MoreRole:
        return m_List[row].ismore;

    case EnableRole:
        return m_List[row].isenabled;
    case AvailableRole:
        qDebug() << "Available " <<m_List[row].isavailable;
        return m_List[row].isavailable;
    default:
        return QVariant();
    }
}

bool MainSettingsModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
 Q_UNUSED(index);
 Q_UNUSED(value);
 Q_UNUSED(role);
    return true;
}


QHash<int, QByteArray> MainSettingsModel::roleNames() const
{
    QHash<int, QByteArray> myroles;

    myroles[NameRole]       = "qml_name";
    myroles[LongnameRole]   = "qml_longName";
    myroles[ShortnameRole]  = "qml_shortName";
    myroles[IconsRole]      = "qml_icon";
    myroles[TypeRole]       = "qml_type";
    myroles[PathRole]       = "qml_path";
    myroles[MoreRole]       = "qml_isMore";
    myroles[EnableRole]     = "qml_isEnable";
    myroles[AvailableRole]  = "qml_isAvailable";

    return myroles;
}
