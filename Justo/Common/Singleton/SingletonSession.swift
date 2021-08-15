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
    
    /// This var can to storage the data for Singleton Object
    ///
    /// ```
    /// sharedManager // Return nothing
    /// ```
    ///
    /// - Warning: This variable can to the storage all the Singleton Information
    /// - Parameter SingletonSession: This var return a single and unique object
    /// - Returns: SingletonSession object
    
    private static var sharedManager: SingletonSession = {
        let sessionManager = SingletonSession()
        return sessionManager
    }()
    
    
    private override init() {
        
        self.userRandomData = NSDictionary.init()
    }
    
    /// This method can to return the created Singleton Object
    ///
    /// ```
    /// shared() // Return SingletonSession
    /// ```
    ///
    /// - Warning: This variable can to the storage all the Singleton Information
    /// - Parameter SingletonSession: This var return a single and unique object
    /// - Returns: SingletonSession object
    class func shared() -> SingletonSession {
        return sharedSession
    }
}
