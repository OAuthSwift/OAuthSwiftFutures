# OAuthSwiftFutures

<img align="left" src="https://raw.githubusercontent.com/OAuthSwift/OAuthSwift/master/Assets/OAuthSwift-icon.png" alt="OAuthSwiftFutures" hspace="20" />
OAuthSwiftFutures bring you [futures/promises](https://en.wikipedia.org/wiki/Futures_and_promises) to OAuthSwift.

It's build on top [BrightFutures](https://github.com/Thomvis/BrightFutures) to achieve great asynchronous code.

<br><br>
<br><br>


## Installation

### Support CocoaPods

* Podfile

```ruby
use_frameworks!

pod 'OAuthSwiftFutures', '~> 1.0.0'
```

### Support Carthage

* Install Carthage (https://github.com/Carthage/Carthage)
* Create Cartfile file
```
github "OAuthSwift/OAuthSwiftFutures" ~> 1.0.0
```
* Run `carthage update`.
* On your application targets’ “General” settings tab, in the “Embedded Binaries” section, drag and drop OAuthSwift.framework and the dependencies from the Carthage/Build/"OSNAME" folder on disk.

## How to use

### OAuth1.0

```swift
let (authorize, handle) = oauthswift.authorizeFuture(withCallbackURL: "oauth-swift://oauth-callback/twitter")
authorize.onSuccess { credential, response, parameters in
  print(credential.oauth_token)
  print(credential.oauth_token_secret)
  print(parameters["user_id"])
}
authorizeFuture.onFailure { error in
  print(error.localizedDescription)
}
```
### OAuth2.0

```swift
let (authorize, handle) = oauthswift.authorizeFuture(withCallbackURL: "oauth-swift://oauth-callback/facebook",
    scope: "likes+comments", state:"generatedone")
authorize.onSuccess { credential, response, parameters in
  print(credential.oauth_token)
}
authorize.onFailure { error in
  print("\(error)")
}
```

### Request

Use one the client new functions
```swift
let (authorize, handle) = oauthswift.client.getFuture("https://api.linkedin.com/v1/people/~")
authorize.onSuccess { data, response in
  let dataString = String(data: data, encoding: String.Encoding.utf8)
  print(dataString)
}
authorize.onFailure { error in
  print("\(error)")
}
```

### Playing with Future

```swift
// after created
let requestFuture = authorize.flatMap { tuple -> Future<(data: Data, response: HTTPURLResponse), OAuthSwiftError> in
    // will be executed only if authorization succeed
    let (future, _) = oauthswift.client.getFuture("https://api.linkedin.com/v1/people/~")
    return future
}
requestFuture.onSuccess { data, response in
  print(data)
}
```
You can learn more at [BrightFutures](https://github.com/Thomvis/BrightFutures)

## License

OAuthSwiftFutures is available under the MIT license. See the LICENSE file for more info.

[![Join the chat at https://gitter.im/dongri/OAuthSwift](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dongri/OAuthSwift?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-iOS_OSX_TVOS-lightgrey.svg?style=flat)](https://developer.apple.com/resources/)
[![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)
[![Cocoapod](http://img.shields.io/cocoapods/v/OAuthSwiftFutures.svg?style=flat)](http://cocoadocs.org/docsets/OAuthSwiftFutures/)
