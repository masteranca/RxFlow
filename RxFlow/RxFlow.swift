//
//  RxFlow.swift
//  Flow
//
//  Created by Anders Carlsson on 02/10/15.
//  Copyright © 2015 CoreDev. All rights reserved.
//

import Foundation

// MARK: RxFlow
public final class RxFlow {

    private let session: NSURLSession

    public convenience init() {
        self.init(session: NSURLSession.sharedSession())
    }

    public convenience init(configuration: NSURLSessionConfiguration) {
        let session = NSURLSession(configuration: configuration)
        self.init(session: session)
    }

    public init(session: NSURLSession) {
        self.session = session
    }

    public func target(url: String) -> Target {
        return Target(url: url, session: session)
    }

    func invalidateSession() {
        self.session.invalidateAndCancel()
    }
}

// MARK: FlowError
public enum FlowError: ErrorType {
    
    case CommunicationError(ErrorType?)
    case UnsupportedStatusCode(NSHTTPURLResponse)
    case ParseError(ErrorType?)
    case NonHttpResponse(NSURLResponse)
}


// MARK: NSHTTPURLResponse - Extension

public extension NSHTTPURLResponse {

    public func isSuccessResponse() -> Bool {
        return (self.statusCode / 100) == 2
    }

    public func headerValueForKey(key: String) -> String? {
        return self.allHeaderFields[key] as? String
    }
    
    public func headers() -> [String:String] {
        var headers:[String:String] = [:]
        
        for (key, value) in self.allHeaderFields {
            headers[key as! String as String!] = value as? String
        }
               
        return headers
    }
}
