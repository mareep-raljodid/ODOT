# ODOT
Requirements:
Qt:
*Additional Libraries: Active Qt, QT 3D
*Qt 5.15.2 FULL
*Developers and designer tools FULL
*Ubuntu 20.4
*ROS Noetic Command Line tools or full installation
*Names of nodes for the camera, lidar, and GPS should be: camera, lidar and gps respectively [can be found in roscli.cpp change it accordingly].
*RosLaunch File name for master launch file should be: ../config/startSensors.launch and package name ODOT [Can be found in file roscli.h, change it accordingly]
 
Steps:
*Clone the repo: ODOT[github.com/mareep-raljodid/ODOT]
*Install required Qt and ROS Dependencies in Ubuntu 20.4
*Open Qt:
*Choose the ODOT.pro file from “Open” inside the repo
*Click on project: choose Desktop Qt 5.15.2 GCC 64BIT from left
*Click on the Run button, wait for the configuration
*Then clock on the green play button
*App Should start
**NOTE: Sometimes depending on Qt updates QtQuick 2.15 might have issues, just change it to 2.1 instead, and should work
 
The above steps will make an OTU named folder in the same directory, it will have the ODOT binary app which can be independently used by just “chmod +x <filename>’ and “./ODOT”
 
No driver dependency is found, any drivers can be used for the GPS, Camera and LIDAR sensors as long as ROS is able to communicate with sensors, this app should b OK
 
The status bar will say “sensor Issue” if all sensors are not detectable through ROS. Record option is by default saving to latest named folder and is changeable. The settings page had a field for camera IP which should not be needed to be filled unless multiple cameras are connected, one camera is auto-detected.
