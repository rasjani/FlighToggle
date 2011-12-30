
include(../../config.pri)

CATALOGNAME=flightoggle
LANGUAGES=en fi 

# hack around the meegotouch_translations.prf, if this isn't empty
# then the generated translations will not be prefixed with '\ !!'
LRELEASE_OPTIONS = -idbased

SOURCEDIR = $$PWD/..
TRANSLATIONDIR = $$PWD
TRANSLATION_INSTALLDIR = $${FLIGHTOGGLE_L10N}
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_defines.prf)
include($$[QT_INSTALL_DATA]/mkspecs/features/meegotouch_translations.prf)
qmfiles.path=$${FLIGHTOGGLE_L10N}

# hack around again?
LRELEASE_OPTIONS -= -markuntranslated '!!\\ '


