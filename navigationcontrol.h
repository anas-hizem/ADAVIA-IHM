#ifndef NAVIGATIONCONTROL_H
#define NAVIGATIONCONTROL_H

#include <QObject>
#include "tcpsocket.h"

class NavigationControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentSpeed READ currentSpeed WRITE setCurrentSpeed NOTIFY currentSpeedChanged)

public:
    explicit NavigationControl(QObject *parent = nullptr);

    int currentSpeed() const;
    int leftMotorSpeed() const;
    int rightMotorSpeed() const;

public slots:
    void setCurrentSpeed(int speed);
    void setLeftMotorSpeed(int speed);
    void setRightMotorSpeed(int speed);
    void forward();
    void backward();
    void left();
    void right();

signals:
    void currentSpeedChanged(int speed);
    void leftMotorSpeedChanged(int speed);
    void rightMotorSpeedChanged(int speed);

private:
    int m_currentSpeed;
    int m_leftMotorSpeed;
    int m_rightMotorSpeed;
    TcpSocket* m_tcpSocket;
};

#endif // NAVIGATIONCONTROL_H
