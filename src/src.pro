TARGET = flightoggle
include(../config.pri)
target.path = $${INSTALL_PREFIX}/$${INSTALL_BIN}

SOURCES += \
    main.cpp \

desktop.files=flightoggle.desktop
desktop.path=$${DESKTOP_INSTALL}




INSTALLS += target \
            desktop

