TEMPLATE = app

QT += qml quick widgets
//QT += multimedia
SOURCES += main.cpp \
    appsdrawer.cpp \
    mainsettingsmodel.cpp

RESOURCES += qml.qrc \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    appsdrawer.h \
    mainsettingsmodel.h

DISTFILES += \
    ../settings_sound.qml
