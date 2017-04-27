# SparkImageView

[![CocoaPods](https://img.shields.io/cocoapods/p/SparkImageView.svg)](https://cocoapods.org/pods/SparkImageView)
[![CocoaPods](https://img.shields.io/cocoapods/v/SparkImageView.svg)](http://cocoapods.org/pods/SparkImageView)
![Travis-CI](https://travis-ci.org/alexsteinerde/Spark-ImageView.svg)

Favorite Animated View written in Swift

![preview](https://github.com/alexsteinerde/Spark-ImageView/blob/master/SparkImageView.gif)


## Requirements

- iOS 8.0+
- Xcode 7.3

## Installation

For manual instalation, drag Source folder into your project.

os use [CocoaPod](https://cocoapods.org) adding this line to you `Podfile`:

```ruby
pod 'SparkImageView', '~> 2.1'
```

## Usage

#### With storyboard or xib files

1) Create a UIImage that inherits from `SparkImageView`

2) Add Image for a `Normal` state

3) Set the `IBOutlet` delegate property to a subclass of `FaveButtonDelegate`

4) ___Optional___ manipulate porperties to change button settings

```swift
@IBInspectable public var dotFirstColor:   UIColor
@IBInspectable public var dotSecondColor:  UIColor
@IBInspectable public var circleFromColor: UIColor
@IBInspectable public var circleToColor:   UIColor
```

## Credits

FaveButton was inspired by Twitter’s Like Heart Animation within their [App](https://itunes.apple.com/us/app/twitter/id333903271)


## Licence

FaveButton is released under the MIT license.











