# Qt project file for linux builds

CONFIG += c++11 plugin
linux-g++-32:ARCHID = 32
linux-g++-64:ARCHID = 64
CONFIG(debug, release|debug):BUILDTYPE = "debug"
CONFIG(release, release|debug):BUILDTYPE = "release"

!exists($(TS3DIR)) {
	error(evironment variable TS3DIR=\'$(TS3DIR)\' invalid or not set);
}

TEMPLATE = lib
TARGET = rp_soundboard
DESTDIR = ../bin/$${BUILDTYPE}_lin

QT += core network widgets gui

DEFINES += LINUX QT_DLL QT_WIDGETS_LIB
CONFIG(debug, release|debug):DEFINES += _DEBUG
CONFIG(release, release|debug):DEFINES += NDEBUG

INCLUDEPATH += ../include

LIBS += -L$(TS3DIR)

LIBS += -lavcodec \
    -lavformat \
    -lavutil \
    -lswresample

QMAKE_POST_LINK += "cp $${DESTDIR}/lib$${TARGET}.so $(TS3DIR)/plugins"


include(./ts3soundboard.pri)

