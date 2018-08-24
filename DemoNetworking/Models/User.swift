//
//  User.swift
//  DemoNetworking
//
//  Created by Sameh sayed on 8/22/18.
//  Copyright © 2018 Sameh sayed. All rights reserved.
//

import Foundation

struct User:Codable
{
    var username:String
    var age:Int
    var friends:[User]?
}
