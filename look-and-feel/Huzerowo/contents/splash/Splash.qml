import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Image {
    id: root
    source: "images/background.png"
    fillMode: Image.PreserveAspectCrop

    property int stage
    
    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        Image {
            id: logo

            anchors.centerIn: parent

            asynchronous: true
            source: "images/plasma.svgz"

            sourceSize.width: PlasmaCore.Units.girdUnit * 2
            sourceSize.height: PlasmaCore.Units.girdUnit * 2
        }

        Image {
            id: busyIndicator

            anchors.centerIn: parent

            asynchronous: true
            source: "images/busywidget.svgz"
            sourceSize.width: PlasmaCore.Units.girdUnit * 4
            sourceSize.height: PlasmaCore.Units.girdUnit * 4
            RotationAnimator on rotation {
                id: rotationAnimatior
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
                running: PlasmaCore.Units.longDuration > 1
            }
        }
    }
    
    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: PlasmaCore.Units.veryLongDuration * 2
        easing.type: Easing.InOutQuad
    }
}
