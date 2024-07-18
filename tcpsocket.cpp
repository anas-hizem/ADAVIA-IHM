#include "tcpsocket.h"
#include <QHostAddress>
#include <QDebug>

TcpSocket::TcpSocket(QObject *parent) : QObject(parent)
{
    socket = new QTcpSocket(this);

    connect(socket, &QTcpSocket::connected, []() {
        qDebug() << "Connected to server";
    });

    connect(socket, &QTcpSocket::disconnected, []() {
        qDebug() << "Disconnected from server";
    });

    connect(socket, &QTcpSocket::readyRead, [this]() {
        QByteArray data = socket->readAll();
        qDebug() << "Data received:" << data;
    });

    connect(socket, QOverload<QAbstractSocket::SocketError>::of(&QAbstractSocket::errorOccurred),
            [this](QAbstractSocket::SocketError socketError) {
                qDebug() << "Socket error:" << socketError;
            });

    // Connect to the server
    socket->connectToHost(QHostAddress("127.0.0.1"), 12345);
}

void TcpSocket::sendSpeed(int speed)
{
    if (socket->state() == QAbstractSocket::ConnectedState) {
        QString message = QString::number(speed);
        socket->write(message.toUtf8());
        socket->flush();
        qDebug() << "Sent speed:" << speed;
    } else {
        qDebug() << "Socket not connected!";
    }
}

void TcpSocket::sendCommand(const QString &command)
{
    if (socket->state() == QAbstractSocket::ConnectedState) {
        QByteArray message = command.toUtf8();
        socket->write(message);
        socket->flush();
        qDebug() << "Sent command:" << command;
    } else {
        qDebug() << "Socket not connected!";
    }
}
void TcpSocket::someSlot()
{
    // Implémentez votre logique de slot ici
    qDebug() << "Some slot called";
}
