# AMRippleButton

[![Version](https://img.shields.io/cocoapods/v/AMRippleButton.svg?style=flat)](https://cocoapods.org/pods/AMRippleButton)
[![License](https://img.shields.io/cocoapods/l/AMRippleButton.svg?style=flat)](https://cocoapods.org/pods/AMRippleButton)
[![Platform](https://img.shields.io/cocoapods/p/AMRippleButton.svg?style=flat)](https://cocoapods.org/pods/AMRippleButton)


## Screen Shot

![Screen Record](/ScreenShots/screenshot.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

iOS 10 and Later


## Installation

AMRippleButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMRippleButton'
```

## Usage

#### in case of Storyboard
how to use

- First, make UIButton instance at your storyboard.
- Then enter class name as "RippleButton" at Identity Inspector.
- That's all.

- Optionally, you can enter Ripple color and Corner radius at Attributes inspector.
- Your button's tint color will be used as ripple color unless you specify. 

#### in case of Swift coding

- import AMRippleButton in your class.
- You can instantiate RippleButton instance just like... let button = RippleButton(frame: ...)


## Author

kaname ohara, kaname.ohara@gmail.com


## License

AMRippleButton is available under the MIT license. See the LICENSE file for more info.

