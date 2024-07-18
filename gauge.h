#ifndef GAUGE_H
#define GAUGE_H

#include <QObject>

class gauge : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(int maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged)
public:
    explicit gauge(QObject *parent = nullptr);

    int value() const;
    void setValue(int value);

    int maxValue() const;
    void setMaxValue(int maxValue);

signals:
    void valueChanged(int value);
    void maxValueChanged(int maxValue);

private:
    int m_value;
    int m_maxValue;
};

#endif // GAUGE_H
