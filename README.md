# What is this

This is an attempt to create a mobile chat application using <a href='https://www.flutter.io'>Flutter</a>. I will use a <a href='https://electronics.howstuffworks.com/bluetooth3.htm'>bluetooth piconet</a> on each device to create a connected mesh graph of local phones and then traverse the graph of each device when a message is sent. It may also be possible to use <a href='https://sidbala.com/h-264-is-magic/'>H.264</a> to send compressed images and videos. After MVP, it would be nice to have some location tagging based on common places around New York, and then create specific, joinable, rooms. For example, if you are with 100m of the Brooklyn Bridge you could join the Brooklyn Bridge "Room", which would have some specific styling associated with the bridge. Finally, I would like to have this working on both iOS and Android and available on each of the respective app stores.

# UI Gifs

This is where gifs of what the UI interactions look like go. Work in progress.

## Messaging System

![Messaging Gif](./walkthrough1.gif)

# How to run the project

This project is built on top of <a href='https://www.flutter.com'>flutter</a>. If you have flutter currently installed on your terminal and a configure phone (iOS or android), you can connect via USB and type `flutter run` to run the simultor on your device.

# Project Architecture

# Wireframes

# Security Audit

# To Do List
- Find rights owning model (copy left?) I want to use.
- Go through security in security audit. Implement bcrypt and <a href='https://pub.dev/packages/flutter_secure_storage'>secure storage</a>
- Make an ads page that reads the last n messages and displays ads based on statistically unique words
- get rid of `optionOpenFade` argument in provider and throughout - didnt need it in the end
- put functions in WriterFunc when appropriate