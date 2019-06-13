//
//  User.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation
import UIKit

class User {
    private static var sharedInstance: User? = User()
    var name: String?
    var birthdate: String?
    
    private init() {}
    
    class func shared() -> User {
        guard let user = sharedInstance else {
            sharedInstance = User()
            return sharedInstance!
        }
        return user
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}
