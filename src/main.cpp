/* vim: set sw=2 ts=2 et tw=77: */

#include <MApplication>
#include <MNotification>
#include <qmdevicemode.h>
#include <QObject>
#include <QDebug>
#include <QThread>
#include <QTimer>
#include <MLocale>
#include "main.h"


FlighToggle::FlighToggle() {
  devmode = new MeeGo::QmDeviceMode();
  mode = devmode->getMode();
  //% "Error while initializing FlighToggle"
  strId = qtTrId("fltt_error");
  connect (devmode, SIGNAL(deviceModeChanged(MeeGo::QmDeviceMode::DeviceMode)), this, SLOT(devModeChanged(MeeGo::QmDeviceMode::DeviceMode)));
}

FlighToggle::~FlighToggle() {
  if (devmode != 0) {
    delete devmode;
    devmode = 0;
  }
  mode = MeeGo::QmDeviceMode::Normal;
}

void FlighToggle::devModeChanged (MeeGo::QmDeviceMode::DeviceMode mode)
{
  switch (mode)
  {
    case MeeGo::QmDeviceMode::Flight:
      qDebug() << "mode = Flight mode";
      break;
    case MeeGo::QmDeviceMode::Normal:
      qDebug() << "mode = Normal";
      break;
    default:
      qDebug() << "mode = Error!!!";
      break;
  }
}


void FlighToggle::triggerToggle() {
  bool success = false;
  mode = devmode->getMode();
  switch (mode) {
      case MeeGo::QmDeviceMode::Flight:
        success = devmode->setMode(MeeGo::QmDeviceMode::Normal);
        success = (devmode->getMode() == MeeGo::QmDeviceMode::Normal);
        if (success) {
          //% "Entering Normal Mode"
          strId  = qtTrId("fltt_exiting");
        } else {
          //% "Error while toggling to Normal Mode"
          strId  = qtTrId("fltt_error_modechange_normal");
        }
        break;
      case MeeGo::QmDeviceMode::Normal:
        success = devmode->setMode(MeeGo::QmDeviceMode::Flight);
        success = (devmode->getMode() == MeeGo::QmDeviceMode::Flight);
        if (success) {
          //% "Entering Flight Mode"
          strId  = qtTrId("fltt_entering");
        } else {
          //% "Error while toggling to Flight Mode"
          strId  = qtTrId("fltt_error_modechange_flight");
        }
        break;
      default:
        //% "Error while toggling from/to Flight Mode"
        strId = "fltt_error_modechange";
        break;
  }

  MNotification *note = new MNotification(MNotification::DeviceEvent,"",strId);
  note->setImage("icon-s-status-flight-mode");
  note->publish();
  QTimer::singleShot(500,MApplication::instance(),SLOT(quit()));
}


int main(int argc, char** argv) {
  int ret;
  MApplication app(argc, argv);
  MLocale::addTranslationPath(QString(FLIGHTOGGLE_L10N));

  FlighToggle *f = new FlighToggle();
 
  QTimer::singleShot(500,f,SLOT(triggerToggle()));
  ret = app.exec();

  delete f;
  return ret;
}

