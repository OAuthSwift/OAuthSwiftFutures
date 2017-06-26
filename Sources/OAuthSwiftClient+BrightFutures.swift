//
//  OAuthSwiftClient+BrightFutures.swift
//  OAuthSwiftFutures
//
//  Created by phimage on 18/12/15.
//  Copyright © 2015 phimage. All rights reserved.
//

import Foundation
import OAuthSwift
import BrightFutures


extension OAuthSwiftClient {

    public typealias FutureSuccess = OAuthSwiftResponse
    public typealias FutureError = OAuthSwiftError
    public typealias FutureResult = (future: Future<FutureSuccess, FutureError>, handle: OAuthSwiftRequestHandle?)

    public func getFuture(_ urlString: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        return requestFuture(urlString, method: .GET, parameters: parameters, headers: headers)
    }

    public func postFuture(_ urlString: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        return requestFuture(urlString, method: .POST, parameters: parameters, headers: headers)
    }

    public func putFuture(_ urlString: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        return requestFuture(urlString, method: .PUT, parameters: parameters, headers: headers)
    }

    public func deleteFuture(_ urlString: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        return requestFuture(urlString, method: .DELETE, parameters: parameters, headers: headers)
    }

    public func patchFuture(_ urlString: String, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
        return requestFuture(urlString, method: .PATCH, parameters: parameters, headers: headers)
    }

    public func requestFuture(_ url: String, method: OAuthSwiftHTTPRequest.Method, parameters: OAuthSwift.Parameters = [:], headers: OAuthSwift.Headers? = nil) -> FutureResult {
       
        let promise = Promise<FutureSuccess, FutureError>()
        let handle = request(
            url, method: method, parameters: parameters, headers: headers,
            success: { response in
                promise.success(response)
            },
            failure: { error in
                promise.failure(error)
            }
        )
        
        return (promise.future, handle)
    }

    public func postImageFuture(_ urlString: String, parameters: OAuthSwift.Parameters, image: Data) -> FutureResult {
        
        let promise = Promise<FutureSuccess, FutureError>()

        let handle = postImage(
            urlString, parameters: parameters, image: image,
            success: { response in
                promise.success(response)
            },
            failure: { error in
                promise.failure(error)
            }
        )
        return (promise.future, handle)
    }

    public func postMultiPartRequestFuture(_ url: String, method: OAuthSwiftHTTPRequest.Method, parameters: OAuthSwift.Parameters, multiparts: [OAuthSwiftMultipartData]) -> FutureResult {
        
        let promise = Promise<FutureSuccess, FutureError>()

        let handle = postMultiPartRequest(url, method: method, parameters: parameters, multiparts: multiparts ,
            success: {response in
                promise.success(response)
            }, failure: { error in
                promise.failure(error)
            }
        )
        return (promise.future, handle)
    }

}
