//
//  SingletonSession.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit

class SingletonSession: NSObject {

    static let sharedSession = SingletonSession()
    
    var userRandomData : NSDictionary
    
    private static var sharedManager: SingletonSession = {
        let sessionManager = SingletonSession()
        return sessionManager
    }()
    
    private override init() {
        
        self.userRandomData = NSDictionary.init()
    }
    
    class func shared() -> SingletonSession {
        return sharedSession
    }
}
