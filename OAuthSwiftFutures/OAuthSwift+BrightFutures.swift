//
//  OAuthSwift+BrightFutures.swift
//  OAuthSwift+BrightFutures
//
//  Created by phimage on 13/12/15.
//  Copyright © 2015 phimage. All rights reserved.
//

import Foundation
import OAuthSwift
import BrightFutures

extension OAuthSwift {
    public typealias TokenSuccess = (credential: OAuthSwiftCredential, response: NSURLResponse?, parameters: Dictionary<String, String>)
    public typealias Failure = NSError
}

extension OAuth1Swift {

    public func authorizeFuture(callbackURL: NSURL) -> Future<OAuthSwift.TokenSuccess, Failure> {

        let promise = Promise<OAuthSwift.TokenSuccess, Failure>()

        self.authorizeWithCallbackURL(callbackURL,
            success: { (credential, response, parameters) -> Void in
                promise.success((credential, response, parameters))
            }
            ,failure:{ (error) -> Void in
                promise.failure(error)
            }
        )

        return promise.future
    }

}

extension OAuth2Swift {

    public func authorizeFuture(callbackURL: NSURL, scope: String, state: String, params: [String: String] = [:]) -> Future<OAuthSwift.TokenSuccess, Failure> {

        let promise = Promise<OAuthSwift.TokenSuccess, NSError>()

        self.authorizeWithCallbackURL(callbackURL, scope: scope, state: state, params: params,
            success: { (credential, response, parameters) -> Void in
                promise.success((credential, response, parameters))
            }
            ,failure:{ (error) -> Void in
                promise.failure(error)
            }
        )

        return promise.future
    }
    
}