#ifndef TCPSOCKET_H
#define TCPSOCKET_H

#include <QObject>
#include <QTcpSocket>

class TcpSocket : public QObject
{
    Q_OBJECT

public:
    explicit TcpSocket(QObject *parent = nullptr);

    void sendSpeed(int speed);
    void sendCommand(const QString &command);

signals:
    void someSignal();

public slots:
    void someSlot();

private:
    QTcpSocket *socket;
};

#endif // TCPSOCKET_H
