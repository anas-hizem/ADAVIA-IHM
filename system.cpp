#include "system.h"
#include <QDateTime>
#include <QDebug>
#include <QUrlQuery>

system::system(QObject *parent)
    : QObject{parent}
    , m_carlocker(true)
    , m_username("Anas")
    , m_apiKey("a3e99a7fc75aeeae7c8126d0671d7513")
    , m_cityName("Monastir")
    , m_temperature(0.0)
    , m_humidity(0.0)
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &system::currentTimeTimerTimeout);
    m_currentTimeTimer->start();
    currentTimeTimerTimeout();

    m_networkManager = new QNetworkAccessManager(this);
    connect(m_networkManager, &QNetworkAccessManager::finished, this, &system::handleWeatherResponse);
    fetchWeatherData();
}

bool system::carlocker() const
{
    return m_carlocker;
}

void system::setCarlocker(bool newCarlocker)
{
    if (m_carlocker == newCarlocker)
        return;
    m_carlocker = newCarlocker;
    emit carlockerChanged(m_carlocker);
}

QString system::username() const
{
    return m_username;
}

QString system::currentTime() const
{
    return m_currentTime;
}

QString system::currentDate() const
{
    return m_currentDate;
}

double system::temperature() const
{
    return m_temperature;
}

double system::humidity() const
{
    return m_humidity;
}

void system::setUsername(const QString newUsername)
{
    if (m_username == newUsername)
        return;
    m_username = newUsername;
    emit usernameChanged(m_username);
}

void system::setCurrentTime(const QString newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged(m_currentTime);
}

void system::setCurrentDate(const QString newCurrentDate)
{
    if (m_currentDate == newCurrentDate)
        return;
    m_currentDate = newCurrentDate;
    emit currentDateChanged(m_currentDate);
}

void system::currentTimeTimerTimeout()
{
    QDateTime currentDateTime = QDateTime::currentDateTime();
    setCurrentTime(currentDateTime.toString("h:mm ap"));
    setCurrentDate(currentDateTime.toString("yyyy-MM-dd"));
    m_currentTimeTimer->start();
}

void system::fetchWeatherData()
{
    QUrl url("http://api.openweathermap.org/data/2.5/weather");
    QUrlQuery query;
    query.addQueryItem("q", m_cityName);
    query.addQueryItem("appid", m_apiKey);
    query.addQueryItem("units", "metric"); // Get temperature in Celsius
    url.setQuery(query);

    QNetworkRequest request(url);
    m_networkManager->get(request);
}

void system::handleWeatherResponse(QNetworkReply *reply)
{
    if (reply->error() == QNetworkReply::NoError) {
        QByteArray responseData = reply->readAll();
        QJsonDocument json = QJsonDocument::fromJson(responseData);
        QJsonObject jsonObject = json.object();
        if (jsonObject.contains("main")) {
            QJsonObject mainObject = jsonObject["main"].toObject();
            if (mainObject.contains("temp")) {
                double temp = mainObject["temp"].toDouble();
                m_temperature = temp;
                emit temperatureChanged(m_temperature);
            }
            if (mainObject.contains("humidity")) {
                double hum = mainObject["humidity"].toDouble();
                m_humidity = hum;
                emit humidityChanged(m_humidity);
            }
        }
    } else {
        qDebug() << "Error fetching weather data:" << reply->errorString();
    }
    reply->deleteLater();
}
