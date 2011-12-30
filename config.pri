CONFIG += meegotouchcore qmsystem2
QT *= gui
# There seems to be a bug in MNotification that it requires QT+=dbus to compile
# but this links dbus libraries into our target binary which we dont really need.
INCLUDEPATH += /usr/include/qt4/QtDBus

MOC_DIR = .moc
OBJECTS_DIR = .objects
QMAKE_LFLAGS_RPATH = -Wl 
QMAKE_CXXFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -fPIC
DESKTOP_INSTALL=/usr/share/applications
INSTALL_PREFIX=/opt/flightoggle
INSTALL_BIN=bin
FLIGHTOGGLE_L10N=/usr/share/l10n/meegotouch/
ICON_PATH=share/pixmaps

DEFINES += "FLIGHTOGGLE_L10N=\\\"$${FLIGHTOGGLE_L10N}\\\""

