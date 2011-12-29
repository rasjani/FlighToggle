CONFIG += meegotouch qmsystem2
QT += dbus
MOC_DIR = .moc
OBJECTS_DIR = .objects
QMAKE_LFLAGS_RPATH = -Wl 
QMAKE_CXXFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden -fPIC
DESKTOP_INSTALL=/usr/share/applications
INSTALL_PREFIX=/opt/flightoggle
INSTALL_BIN=bin
FLIGHTOGGLE_L10N=$${INSTALL_PREFIX}/share/l10n
ICON_PATH=share/pixmaps

DEFINES += "FLIGHTOGGLE_L10N=\\\"$${FLIGHTOGGLE_L10N}\\\""

# hack around the meegotouch_translations.prf, if this isn't empty
# then the generated translations will not be prefixed with '\ !!'
LRELEASE_OPTIONS = -idbased

SOURCEDIR = $$PWD/src
TRANSLATIONDIR = $$PWD/src/translations
TRANSLATION_INSTALLDIR = /usr/share/l10n/meegotouch
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_defines.prf)
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_translations.prf)
qmfiles.path=$${FLIGHTOGGLE_L10N}

# hack around again?
LRELEASE_OPTIONS -= -markuntranslated '!!\\ '


