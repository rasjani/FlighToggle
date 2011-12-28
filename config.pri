CONFIG += meegotouch qmsystem2
MOC_DIR = .moc
OBJECTS_DIR = .objects
QMAKE_LFLAGS_RPATH = -Wl 
QMAKE_CXXFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -fPIC
DESKTOP_INSTALL=/usr/share/applications
INSTALL_PREFIX=/opt/flightoggle
INSTALL_BIN=bin

