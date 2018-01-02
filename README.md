# SANotificationViews

[![CI Status](http://img.shields.io/travis/shamshiranees/SANotificationViews.svg?style=flat)](https://travis-ci.org/shamshiranees/SANotificationViews)
[![Version](https://img.shields.io/cocoapods/v/SANotificationViews.svg?style=flat)](http://cocoapods.org/pods/SANotificationViews)
[![License](https://img.shields.io/cocoapods/l/SANotificationViews.svg?style=flat)](http://cocoapods.org/pods/SANotificationViews)
[![Platform](https://img.shields.io/cocoapods/p/SANotificationViews.svg?style=flat)](http://cocoapods.org/pods/SANotificationViews)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Swift 3.0+ <br>
Xcode 8.0+ <br>

## Installation

SANotificationViews is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SANotificationViews'
```
or add [SANotificationViews.swift](https://github.com/shamshiranees/SANotificationViews/blob/master/SANotificationViews/Classes/SANotificationViews.swift) file into your project directory.

## Usage
### SAStatusView
![ScreenShot](https://raw.githubusercontent.com/shamshiranees/SANotificationViews/master/Example/SANotificationViews/statusBar1.png)
```swift
SANotificationView.showSAStatusBarBanner(message: "This is status bar banner...", backgroundColor: .black, textColor: .white, showTime: 2)
```
### SATinybanner
![ScreenShot](https://raw.githubusercontent.com/shamshiranees/SANotificationViews/master/Example/SANotificationViews/tinyBanner1.png)
```swift
SANotificationView.showSATinyBanner(message: "Please wait while loading...😊", backgroundColor: .black, textColor: .white, showTime: 2)
```

### SABanner
![ScreenShot](https://raw.githubusercontent.com/shamshiranees/SANotificationViews/master/Example/SANotificationViews/SABanner2.png)
```swift
SANotificationView.showSABanner(title: "V.S Achuthananthan", message: "V.S Achuthananthan just liked the your post you shared", image: #imageLiteral(resourceName: "sampleImage"),  showTime: 3)

//show SABanner with background color and text color
SANotificationView.showSABanner(title: "V.S Achuthananthan", message: "V.S Achuthananthan just liked the your post you shared", textColor: .black, image: #imageLiteral(resourceName: "sampleImage"), backgroundColor: .white, showTime: 3)

```

### SAPermanentView
```swift
//Show view
 SANotificationView.showSATinyBanner(message: "Permanent Banner...😊", backgroundColor: .black, textColor: .white)
 
//Remove view
SANotificationView.removeSATinyBanner()

```


## Author

 shamshir.anees@citrusinformatics.com

## License

SANotificationViews is available under the MIT license. See the LICENSE file for more info.
