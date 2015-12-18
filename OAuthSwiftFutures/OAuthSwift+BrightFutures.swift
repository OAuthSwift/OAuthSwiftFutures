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

extension OAuth1Swift {

    public func authorizeFuture(callbackURL: NSURL) -> Future<(OAuthSwiftCredential, NSURLResponse),NSError> {

        let promise = Promise<(OAuthSwiftCredential,NSURLResponse), NSError>()

        self.authorizeWithCallbackURL(callbackURL,
            success: { (credential, response) -> Void in
                promise.success((credential, response))
            }
            ,failure:{ (error) -> Void in
                promise.failure(error)
            }
        )

        return promise.future
    }

}

extension OAuth2Swift {

    public func authorizeFuture(callbackURL: NSURL, scope: String, state: String, params: Dictionary<String, String> = Dictionary<String, String>()) -> Future<(OAuthSwiftCredential, NSURLResponse?, NSDictionary),NSError> {

        let promise = Promise<(OAuthSwiftCredential, NSURLResponse?, NSDictionary), NSError>()

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