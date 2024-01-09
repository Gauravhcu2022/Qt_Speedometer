import QtQuick
import QtQuick.Controls
import Speedometer


ApplicationWindow {
    visible: true
    width: 1600
    height: 1400
    title: "Speedometer Application"
    color: "black"

    property bool leftIndicatorVisible: false
    property bool rightIndicatorVisible: false

    Image {
        source: "speedometer_background.png"
        width:  600
        height: 400
        anchors.top: parent.top
        anchors.topMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 625
        z: -1

        // Needle
        Item {
            width: 760
            height: 4
            anchors.bottomMargin: 24
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: -270
            z : 2
            Rectangle {
                width: parent.width / 2
                height: parent.height
                color: "transparent"
                rotation: Math.min(Math.max(speedometerController.displayedValue, -90), 108) * 1.8

                Rectangle {
                    width: parent.width / 2
                    height: parent.height
                    color: "red"
                    rotation: 0  // Rotate the second half by 0 degrees

                    Rectangle {
                        id: needle
                        width: 10
                        height: 120
                        color: "transparent"
                    }
                }
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            SpeedometerController {
                id: speedometerController
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: parent.right
            anchors.rightMargin: 285
            anchors.top: parent.top
            anchors.topMargin: 250
            font.pixelSize: 30
            text: speedometerController.displayedValue
            color: "white"
            z: 1
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: parent.right
            anchors.rightMargin: 280
            anchors.top: parent.top
            anchors.topMargin: 230
            font.pixelSize: 20
            text: "MPH"
            color: "blue"
        }
        // Left Indicator Arrow
        Rectangle {
            width: 60
            height: 60
            color: "transparent"
            anchors.left: parent.left
            anchors.leftMargin: 200
            anchors.top: parent.top
            anchors.topMargin: 290
            z: 1

            Text {
                font.pixelSize: 60
                font.weight: Font.DemiBold
                text: "<"
                color: leftIndicatorVisible ? "yellow" : "transparent"
            }

            Timer {
                interval: 500  // Blink every 500 milliseconds
                repeat: true
                running: leftIndicatorVisible
                onTriggered: {
                    // Toggle visibility
                    leftIndicatorVisible = !leftIndicatorVisible;
                }
            }
        }
        // static left indicator
        Rectangle {
            width: 60
            height: 60
            color: "transparent"
            anchors.left: parent.left
            anchors.leftMargin: 200
            anchors.top: parent.top
            anchors.topMargin: 290
            z: 0

            Text {
                font.pixelSize: 60
                font.weight: Font.DemiBold
                text: "<"
                color: "white"
            }
        }
        // Right Indicator Arrow
        Rectangle {
            width: 60
            height: 60
            color:"transparent"
            anchors.right: parent.right
            anchors.rightMargin: 175
            anchors.top: parent.top
            anchors.topMargin: 290
            z: 1

            Text {
                font.pixelSize: 60
                font.weight: Font.DemiBold
                text: ">"
                color: rightIndicatorVisible ? "yellow" : "transparent"
            }

            Timer {
                interval: 500  // Blink every 500 milliseconds
                repeat: true
                running: rightIndicatorVisible
                onTriggered: {
                    // Toggle visibility
                    rightIndicatorVisible = !rightIndicatorVisible;
                }
            }
        }
        // static right indicator
        Rectangle {
            width: 60
            height: 60
            color:"transparent"
            anchors.right: parent.right
            anchors.rightMargin: 175
            anchors.top: parent.top
            anchors.topMargin: 290
            z: 0

            Text {
                font.pixelSize: 60
                font.weight: Font.DemiBold
                text: ">"
                color: "white"
            }
        }
    }

    // Brake Button
    Rectangle {
        width: 100
        height: 50
        color: "white"
        anchors.left: parent.left
        anchors.leftMargin: 630
        anchors.top: parent.top
        anchors.topMargin: 590
        z: 1

        Text {
            anchors.centerIn: parent
            text: "Brake"
            color: "red"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                brakeTimer.start();
            }

            onReleased: {
                brakeTimer.stop();
            }
        }

        Timer {
            id: brakeTimer
            interval: 100
            repeat: true
            running: false
            onTriggered: {
                speedometerController.brake();
            }
        }
    }

    // Accelerator Button
    Rectangle {
        width: 100
        height: 50
        color: "red"
        anchors.right: parent.right
        anchors.rightMargin: 620
        anchors.top: parent.top
        anchors.topMargin: 590
        z: 1

        Text {
            anchors.centerIn: parent
            text: "Accelerator"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                accelerationTimer.start();
            }

            onReleased: {
                accelerationTimer.stop();
                autoReduceSpeedTimer.start();
            }
        }
        Timer {
         id: accelerationTimer
         interval: 100
         repeat: true
         running: false
            onTriggered: {
               speedometerController.accelerate();
           }
        }
    }



    // left indicator button
    Rectangle {
        width: 120
        height: 40
        color: "yellow"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 320
        anchors.left: parent.left
        anchors.leftMargin: 610
        z: 1

        Text {
            anchors.centerIn: parent
            text: "Left Indicator"
            color: "red"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                leftIndicatorVisible = true;
                rightIndicatorVisible = false;
                leftIndicatorBlink.start();
                rightIndicatorBlink.stop();
            }
        }
    }

    // right indicator button
    Rectangle {
        width: 120
        height: 40
        color: "yellow"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 320
        anchors.right: parent.right
        anchors.rightMargin: 600
        z: 1

        Text {
            anchors.centerIn: parent
            text: "Right Indicator"
            color: "red"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                leftIndicatorVisible = false;
                rightIndicatorVisible = true;
                leftIndicatorBlink.stop();
                rightIndicatorBlink.start();
            }
        }
    }

    // Button to turn off blinking
    Rectangle {
        width: 120
        height: 40
        color: "blue"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 320
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1

        Text {
            anchors.centerIn: parent
            text: "Off Indicator"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                leftIndicatorVisible = false;
                rightIndicatorVisible = false;
                leftIndicatorBlink.stop();
                rightIndicatorBlink.stop();
            }
        }
    }

    Timer {
        id: leftIndicatorBlink
        interval: 500  // Blink every 500 milliseconds
        repeat: true
        running: false
        onTriggered: {
            leftIndicatorVisible = !leftIndicatorVisible;
        }
    }

    Timer {
        id: rightIndicatorBlink
        interval: 500  // Blink every 500 milliseconds
        repeat: true
        running: false
        onTriggered: {
            rightIndicatorVisible = !rightIndicatorVisible;
        }
    }
    //auto reduce speed by 0.5 km/h per sec
    Timer {
        id: autoReduceSpeedTimer
        interval: 1000  // Reduce speed every 1 second
        repeat: true
        running: false
        onTriggered: {
            speedometerController.reduceSpeed();
        }
    }

}
