

/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Design Studio.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.8
import QtQuick3D 1.15

Item {
    id: start
    width: 480
    height: 272

    signal startClicked
    signal settingsClicked

    Flatbackground {
        id: backgroundfull
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            id: text1
            x: 330
            y: 8
            width: 134
            height: 19
            color: "#00bafb"
            text: qsTr("CURRENT TIME")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: image
            x: 259
            y: 45
            width: 189
            height: 166
            source: "assets/MicrosoftTeams-image.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Timedate {
        id: start_timedateinstance
        x: 425
        y: 8
        width: 47
        height: 30
    }

    Image {
        id: startButton
        anchors.verticalCenter: parent.verticalCenter
        source: "assets/drumcopy_temp.png"
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: -95
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: startlabel
            width: 80
            height: 37
            color: "#ffffff"
            text: "Start"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Maven Pro"
        }

        MouseArea {
            id: startMA

            anchors.fill: parent
            anchors.bottomMargin: -1
            anchors.leftMargin: 1
            anchors.topMargin: 1
            anchors.rightMargin: -1

            Connections {
                target: startMA
                onClicked: startClicked()
            }

            Text {
                id: text2
                x: 54
                y: 106
                width: 65
                height: 23
                color: "#f8e0cf"
                text: qsTr("Sensors")
                font.pixelSize: 17
                font.family: "Maven Pro"
            }

            Image {
                id: image1
                x: 9
                y: 3
                width: 152
                height: 170
                opacity: 0.311
                source: "assets/aa.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
