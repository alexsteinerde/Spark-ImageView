# SparkImageView

[![CocoaPods](https://img.shields.io/cocoapods/p/SparkImageView.svg)](https://cocoapods.org/pods/SparkImageView)
[![CocoaPods](https://img.shields.io/cocoapods/v/SparkImageView.svg)](http://cocoapods.org/pods/SparkImageView)

Favorite Animated Button written in Swift

![preview](https://github.com/alexsteinerde/Spark-ImageView/blob/master/fave-button1.gif)


## Requirements

- iOS 8.0+
- Xcode 7.3

## Installation

For manual instalation, drag Source folder into your project.

os use [CocoaPod](https://cocoapods.org) adding this line to you `Podfile`:

```ruby
pod 'FaveButton', '~> 2.1'
```


## Usage

#### With storyboard or xib files

1) Create a Button that inherits from `FaveButton`

2) Add Image for a `Normal` state

3) Set the `IBOutlet` delegate property to a subclass of `FaveButtonDelegate`

4) ___Optional___ manipulate porperties to change button settings

```swift
@IBInspectable public var dotFirstColor:   UIColor
@IBInspectable public var dotSecondColor:  UIColor
@IBInspectable public var circleFromColor: UIColor
@IBInspectable public var circleToColor:   UIColor
```

#### In Code

Needs to add later.

## Manipulating dot colors

If you want differents colors for dots like `Twitter’s Heart Animation` use the delegate method for the button you want.

```swift
func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
	if faveButton == myFaveButton{
		// return dot colors
	}
	return nil
}
```

in [FaveButtonDemo](https://github.com/xhamr/fave-button/tree/master/FaveButtonDemo) you will find a set of color to cause dots appear like this:

![preview](https://github.com/xhamr/fave-button/blob/master/fave-button2.gif)



## Credits

FaveButton was inspired by Twitter’s Like Heart Animation within their [App](https://itunes.apple.com/us/app/twitter/id333903271)


## Licence

FaveButton is released under the MIT license.











