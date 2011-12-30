include(../../config.pri)

CATALOGNAME=flightoggle
LANGUAGES=en fi

# hack around the meegotouch_translations.prf, if this isn't empty
# then the generated translations will not be prefixed with '\ !!'
LRELEASE_OPTIONS = -idbased

SOURCEDIR = $$PWD/..
TRANSLATIONDIR = $$PWD
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_defines.prf)
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_translations.prf)

# hack around again?
LRELEASE_OPTIONS -= -markuntranslated '!!\\ '


