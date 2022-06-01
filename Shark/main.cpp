#include <QApplication>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>
#include <qqmlcontext.h>
#include <qqml.h>

#include "appsdrawer.h"
#include "mainsettingsmodel.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<AppsDrawer>("com.hmi", 1, 0,"AppsDrawer");// you need to create instance in qml then only it will work
    qmlRegisterType<MainSettingsModel>("com.settings", 1, 0,"MainSettingsModel");// you need to create instance in qml then only it will work

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/main.qml"));
    view.setTitle("HMI-Shark");

    view.showNormal();

    return app.exec();
}
