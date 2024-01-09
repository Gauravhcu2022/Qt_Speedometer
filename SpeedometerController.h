#ifndef SPEEDOMETERCONTROLLER_H
#define SPEEDOMETERCONTROLLER_H

#include <QObject>

class SpeedometerController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int displayedValue READ getDisplayedValue NOTIFY displayedValueChanged)

public:
    explicit SpeedometerController(QObject *parent = nullptr);

    int getDisplayedValue() const;

public slots:
    void accelerate();
    void brake();
    void reduceSpeed();  // Added this function

signals:
    void displayedValueChanged();

private:
    int m_speed;
    static const int MAX_SPEED = 100;
};

#endif // SPEEDOMETERCONTROLLER_H
