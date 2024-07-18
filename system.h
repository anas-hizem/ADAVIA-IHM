#ifndef SYSTEM_H
#define SYSTEM_H
#include <QObject>
#include <QTimer>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>

class system : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carlocker READ carlocker WRITE setCarlocker NOTIFY carlockerChanged FINAL)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(QString currentDate READ currentDate WRITE setCurrentDate NOTIFY currentDateChanged FINAL)
    Q_PROPERTY(double temperature READ temperature NOTIFY temperatureChanged FINAL)
    Q_PROPERTY(double humidity READ humidity NOTIFY humidityChanged FINAL)

public:
    explicit system(QObject *parent = nullptr);

    bool carlocker() const;
    QString username() const;
    QString currentTime() const;
    QString currentDate() const;
    double temperature() const;
    double humidity() const;

public slots:
    void setCarlocker(bool newCarlocker);
    void setUsername(const QString newUsername);
    void setCurrentTime(const QString newCurrentTime);
    void setCurrentDate(const QString newCurrentDate);
    void currentTimeTimerTimeout();
    void fetchWeatherData();

signals:
    void carlockerChanged(bool newCarlocker);
    void usernameChanged(const QString newUsername);
    void currentTimeChanged(const QString newCurrentTime);
    void currentDateChanged(const QString newCurrentDate);
    void temperatureChanged(double newTemperature);
    void humidityChanged(double newHumidity);

private:
    bool m_carlocker;
    QString m_username;
    QString m_currentTime;
    QString m_currentDate;
    QTimer *m_currentTimeTimer;
    QNetworkAccessManager *m_networkManager;
    QString m_apiKey;
    QString m_cityName;
    double m_temperature;
    double m_humidity;

private slots:
    void handleWeatherResponse(QNetworkReply *reply);
};

#endif // SYSTEM_H
