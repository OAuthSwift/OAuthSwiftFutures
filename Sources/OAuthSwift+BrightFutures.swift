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
    public typealias FutureSuccess = (credential: OAuthSwiftCredential, response: URLResponse?, parameters: OAuthSwift.Parameters) // see OAuthSwift.TokenSuccessHandler
    public typealias FutureError = OAuthSwiftError
    public typealias FutureResult = (future: Future<FutureSuccess, FutureError>, handle: OAuthSwiftRequestHandle?)
}

extension OAuth1Swift {
    
    
    open func authorizeFuture(withCallbackURL callbackURL: String) -> FutureResult {
        let promise = Promise<FutureSuccess, FutureError>()
        
        let handle = self.authorize(
            withCallbackURL: callbackURL,
            success: { credential, response, parameters in
                promise.success((credential, response, parameters))
            },
            failure:{ error in
                promise.failure(error)
            }
        )
        
        return (promise.future, handle)
    }

    open func authorizeFuture(withCallbackURL callbackURL: URL) -> FutureResult {

        let promise = Promise<FutureSuccess, FutureError>()
        
        let handle = self.authorize(
            withCallbackURL: callbackURL,
            success: { credential, response, parameters in
                promise.success((credential, response, parameters))
            },
            failure:{ error in
                promise.failure(error)
            }
        )

        return (promise.future, handle)
    }

}

extension OAuth2Swift {

    open func authorizeFuture(withCallbackURL callbackURL: URL, scope: String, state: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {

        let promise = Promise<FutureSuccess, FutureError>()
        
         let handle = self.authorize(
            withCallbackURL: callbackURL, scope: scope, state: state, parameters: parameters, headers: headers,
            success: { credential, response, parameters in
                promise.success((credential, response, parameters))
            },
            failure:{ (error) -> Void in
                promise.failure(error)
            }
        )
        
        return (promise.future, handle)
    }
    
    open func authorizeFuture(withCallbackURL callbackURL: String, scope: String, state: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        
        let promise = Promise<FutureSuccess, FutureError>()
        
        let handle = self.authorize(
            withCallbackURL: callbackURL, scope: scope, state: state, parameters: parameters, headers: headers,
            success: { credential, response, parameters in
                promise.success((credential, response, parameters))
            },
            failure:{ (error) -> Void in
                promise.failure(error)
            }
        )
        
        return (promise.future, handle)
    }
    
}
