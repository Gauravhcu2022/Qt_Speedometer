#include "SpeedometerController.h"
#include <QTimer>

SpeedometerController::SpeedometerController(QObject *parent) : QObject(parent), m_speed(0)
{
}

int SpeedometerController::getDisplayedValue() const
{
    return m_speed;
}

void SpeedometerController::accelerate()
{
    if (m_speed < MAX_SPEED - 1 )
    {
        m_speed += 2;  // Increase speed by 2 units
        emit displayedValueChanged();
    }
    else if(m_speed == 99){
        m_speed += 1;
        emit displayedValueChanged();
    }
}

void SpeedometerController::brake()
{
    if (m_speed > 1)
    {
        m_speed -= 2;  // Decrease speed by 2 units
        emit displayedValueChanged();
    }
    else if(m_speed == 1){
        m_speed -= 1;
        emit displayedValueChanged();
    }
}

void SpeedometerController::reduceSpeed()
{
    if (m_speed > 0)
    {
        m_speed -= 0.5;  // Decrease speed by 0.5 units
        emit displayedValueChanged();
    }
}
