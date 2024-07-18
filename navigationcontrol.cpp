    #include "navigationcontrol.h"

    NavigationControl::NavigationControl(QObject *parent)
        : QObject(parent), m_currentSpeed(0)
    {
        m_tcpSocket = new TcpSocket(this);
    }

    int NavigationControl::currentSpeed() const
    {
        return m_currentSpeed;
    }
    int NavigationControl::leftMotorSpeed() const
    {
        return m_leftMotorSpeed;
    }
    int NavigationControl::rightMotorSpeed() const
    {
        return m_rightMotorSpeed;
    }


    void NavigationControl::setCurrentSpeed(int speed)
    {
        if (speed != m_currentSpeed) {
            m_currentSpeed = speed;
            emit currentSpeedChanged(m_currentSpeed);
        }
    }
    void NavigationControl::setLeftMotorSpeed(int speed)
    {
        if (speed != m_leftMotorSpeed) {
            m_leftMotorSpeed = speed;
            emit leftMotorSpeedChanged(m_leftMotorSpeed);
        }
    }

    void NavigationControl::setRightMotorSpeed(int speed)
    {
        if (speed != m_rightMotorSpeed) {
            m_rightMotorSpeed = speed;
            emit rightMotorSpeedChanged(m_rightMotorSpeed);
        }
    }

    void NavigationControl::forward()
    {
        m_tcpSocket->sendCommand("FORWARD");
    }

    void NavigationControl::backward()
    {
        m_tcpSocket->sendCommand("BACKWARD");
    }

    void NavigationControl::left()
    {
        m_tcpSocket->sendCommand("LEFT");
    }

    void NavigationControl::right()
    {
        m_tcpSocket->sendCommand("RIGHT");
    }
