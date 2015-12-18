# OAuthSwiftFutures

<img align="left" src="https://raw.githubusercontent.com/OAuthSwift/OAuthSwift/master/Assets/OAuthSwift-icon.png" alt="OAuthSwiftFutures" hspace="20" />
OAuthSwiftFutures bring you [futures/promises](https://en.wikipedia.org/wiki/Futures_and_promises) to OAuthSwift.

It's build on top [BrightFutures](https://github.com/Thomvis/BrightFutures) to achieve great asynchronous code.

<br><br>
<br><br>


## Installation

### Support CocoaPods

* Podfile

```
use_frameworks!

pod "OAuthSwiftFutures"
```
## How to use
### OAuth1.0
```swift
let authorizeFuture = oauthswift.authorizeFuture(NSURL(string: "oauth-swift://oauth-callback/twitter")!)
authorizeFuture.onSuccess { credential, response, parameters in
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
let authorizeFuture = oauthswift.authorizeFuture(NSURL(string: "oauth-swift://oauth-callback/facebook")!,
    scope: "likes+comments", state:"generatedone")
authorizeFuture.onSuccess { credential, response, parameters in
  print(credential.oauth_token)
}
authorizeFuture.onFailure { error in
  print(error.localizedDescription)
}
```

### Playing with Future
```
// after created
let requestFuture = authorizeFuture.flatMap { tuple -> Future<(data: NSData, response: NSHTTPURLResponse), NSError> in
    // will be executed only if authorization succeed
    return oauthswift.client.getFuture("https://api.linkedin.com/v1/people/~")
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
