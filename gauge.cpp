#include "gauge.h"

gauge::gauge(QObject *parent)
    : QObject(parent), m_value(0), m_maxValue(280)
{
}

int gauge::value() const
{
    return m_value;
}

void gauge::setValue(int value)
{
    if (value != m_value) {
        m_value = value;
        emit valueChanged(m_value);
    }
}

int gauge::maxValue() const
{
    return m_maxValue;
}

void gauge::setMaxValue(int maxValue)
{
    if (maxValue != m_maxValue) {
        m_maxValue = maxValue;
        emit maxValueChanged(m_maxValue);
    }
}
