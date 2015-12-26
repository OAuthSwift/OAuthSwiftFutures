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

    public typealias Success = (data: NSData, response: NSHTTPURLResponse)
    public typealias Failure = NSError

    public func getFuture(urlString: String, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {
        return self.requestFuture(urlString, method: .GET, parameters: parameters, headers: headers)
    }

    public func postFuture(urlString: String, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {
        return self.requestFuture(urlString, method: .POST, parameters: parameters, headers: headers)
    }

    public func putFuture(urlString: String, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {
        return self.requestFuture(urlString, method: .PUT, parameters: parameters, headers: headers)
    }

    public func deleteFuture(urlString: String, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {
        return self.requestFuture(urlString, method: .DELETE, parameters: parameters, headers: headers)
    }

    public func patchFuture(urlString: String, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {
        return self.requestFuture(urlString, method: .PATCH, parameters: parameters, headers: headers)
    }

    public func requestFuture(url: String, method: OAuthSwiftHTTPRequest.Method, parameters: [String: AnyObject] = [:], headers: [String:String]? = nil) -> Future<Success, Failure> {

        let promise = Promise<Success, Failure>()

        self.request(url, method: method, parameters: parameters, headers: headers,
            success: {data, response in
                promise.success((data: data, response: response))
            }, failure: { error in
                promise.failure(error)
            }
        )
        return promise.future
    }
    
}