//
//  APIResponse.swift
//  DemoNetworking
//
//  Created by Sameh sayed on 8/22/18.
//  Copyright © 2018 Sameh sayed. All rights reserved.
//

import Foundation

struct APIResponse<T:Decodable>:Decodable
{
    var success:Bool
    var message:String
    var data:T?
}
