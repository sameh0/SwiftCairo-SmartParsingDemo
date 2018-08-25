//
//  Car.swift
//  DemoNetworking
//
//  Created by Sameh sayed on 8/25/18.
//  Copyright © 2018 Sameh sayed. All rights reserved.
//

import Foundation

struct Car:Codable
{
    var name:String
    var model:Model
    
    enum Model:String,CodingKey
    {
        case toyota,mercedes,bmw
    }
    
    enum CodingKeys: String,CodingKey
    {
        case name,model
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let modelString = try values.decode(String.self, forKey: .model)
        model = Model(rawValue: modelString)!
        name = try values.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(model.rawValue, forKey: .model)
    }
}
