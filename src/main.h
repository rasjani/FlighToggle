#ifndef _FLIGHTOGGLE_H
#define _FLIGHTOGGLE_H


#include <qmdevicemode.h>
#include <QObject>


class FlighToggle : public QObject {
  Q_OBJECT
  public:
    FlighToggle();
    ~FlighToggle();
  public slots:
    void triggerToggle();
    void devModeChanged (MeeGo::QmDeviceMode::DeviceMode mode);

  private:
    MeeGo::QmDeviceMode *devmode;
    MeeGo::QmDeviceMode::DeviceMode mode;
    QString strId;
};


#endif
