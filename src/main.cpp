/* vim: set sw=2 ts=2 et tw=77: */ 

#include <MApplication>
#include <qmdevicemode.h>
#include <QDebug>



using namespace MeeGo;

int main(int argc, char** argv) {

  MApplication app(argc, argv);
  QmDeviceMode *devmode = new QmDeviceMode();
  QmDeviceMode::DeviceMode mode =  devmode->getMode();
  switch (mode) {   
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

