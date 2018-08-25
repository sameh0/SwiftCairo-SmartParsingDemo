//
//  NetworkManager.swift
//  DemoNetworking
//
//  Created by Sameh sayed on 8/22/18.
//  Copyright © 2018 Sameh sayed. All rights reserved.
//

import Foundation
import Alamofire

extension Encodable
{
    func toJson()->[String:Any]?
    {
        guard
            let encoded = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: encoded, options: .allowFragments) as? [String:Any]
            else { return nil }
        
        return dictionary
    }
}

extension Data
{
    func getObject<T:Decodable>()->T?
    {
        do
        {
            let parsedData  = try JSONDecoder().decode(T.self, from: self)
            return parsedData
        }
        catch let error
        {
            print(error)
        }
        return nil
    }
}
extension Sequence
{
    func getData()->Data?
    {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
    
    func getObject<T:Decodable>()->T?
    {
        guard
            let data = self.getData() else{ return nil }
        return data.getObject()
    }
}

class NetworkManager
{
    class func makeRequest<T:Decodable>(parameters:Encodable?,url:String, completion: @escaping (_ response:APIResponse<T>?) -> ())
    {
        let json = parameters?.toJson() ?? nil
        
        Alamofire.request(
            url,
            method: .get,
            parameters: json,
            encoding: JSONEncoding.default
            )
            
            .validate(contentType: ["application/json"])
            
            .responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let result):
                    let obj:APIResponse<T>? = (result as? NSDictionary)?.getObject()
                    completion(obj)
                    
                case .failure( _):
                    completion( nil)
                }
        }
    }
    
}
