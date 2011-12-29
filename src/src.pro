TARGET = flightoggle
include(../config.pri)
target.path = $${INSTALL_PREFIX}/$${INSTALL_BIN}

SOURCES += \
    main.cpp \


HEADERS += \
    main.h \ 

desktop.files=flightoggle.desktop
desktop.path=$${DESKTOP_INSTALL}
icon.files=flightoggle.png
icon.path=$${INSTALL_PREFIX}/$${ICON_PATH}



INSTALLS += target \
            desktop \
            icon \


