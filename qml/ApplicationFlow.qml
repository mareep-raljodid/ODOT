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
import QtMultimedia 5.4
import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import RosCLI 1.0

Item {

    RosCLI {
        id: ros
    }



    id: root
    state: "start"

    width: 480
    height: 272

    StartScreen {
        id: startScreen

        visible: true

        onStartClicked: {
            ros.startSensors("[DBG] ROS Sensors Started");
            root.state = "presets"
        }

        onSettingsClicked: {
            root.state = "settings"
        }
    }

    PresetsScreen {
        id: presetsScreen

        visible: false

        onStartRun: {
            root.state = "running"
            runningScreen.startRun()
        }

        onCancelPresets: {
            root.state = "start"
        }
    }

    Popup {
            parent: Overlay.overlay
            x: Math.round((parent.width - width) / 2) - 170
            y: Math.round((parent.height - height) / 2) - 110
            //width: 100
            //height: 100
            padding: 0
            id: popup
            contentItem: Item {
                id: settingScreen
                width: 480
                height: 272
                Rectangle {

                    id: rectangle
                    x: 0
                    y: 0
                    width: 350
                    height: 220
                    color: "#206c3c"

                    Text {
                        id: text1
                        x: 135
                        y: 0
                        text: qsTr("Live Camera")
                        font.pixelSize: 14
                        font.family: "Maven Pro"
                        styleColor: "#ffffff"
                    }

                    Camera {
                           id: camera

                           imageCapture {
                               onImageCaptured: {
                                   // Show the preview in an Image
                                   photoPreview.source = preview
                               }
                           }
                       }

                       VideoOutput {
                           source: camera
                           focus : visible // to receive focus and capture key events when visible
                           anchors.fill: parent
                       }

                       Image {
                           id: photoPreview
                       }
                }
            }
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }


    RunningScreen {
        id: runningScreen

        runDuration: presetsScreen.runDuration
        visible: false
        bigbutton.onClicked: {
            onClicked: popup.open()
        }

        onRunFinished: {
            root.state = "start"
        }
    }

    SettingsScreen {
        id: settingsScreen

        visible: true
    }

    states: [
        State {
            name: "start"

            PropertyChanges {
                target: startScreen
                visible: true
            }

            PropertyChanges {
                target: settingsScreen
                visible: false
            }

            PropertyChanges {
                target: presetsScreen
                visible: false
            }

            PropertyChanges {
                target: runningScreen
                visible: false
                activated: false
            }
        },
        State {
            name: "settings"

            PropertyChanges {
                target: startScreen
                visible: false
            }

            PropertyChanges {
                target: settingsScreen
                visible: true
            }

            PropertyChanges {
                target: presetsScreen
                visible: false
            }

            PropertyChanges {
                target: runningScreen
                visible: false
                activated: false
            }
        },
        State {
            name: "presets"

            PropertyChanges {
                target: startScreen
                visible: false
            }

            PropertyChanges {
                target: settingsScreen
                visible: false
            }

            PropertyChanges {
                target: presetsScreen
                visible: true
            }

            PropertyChanges {
                target: runningScreen
                visible: false
                activated: false
            }
        },
        State {
            name: "running"

            PropertyChanges {
                target: startScreen
                visible: false
            }

            PropertyChanges {
                target: settingsScreen
                visible: false
            }

            PropertyChanges {
                target: presetsScreen
                visible: false
            }

            PropertyChanges {
                target: runningScreen
                visible: true
                activated: true
            }
        }

    ]
}
