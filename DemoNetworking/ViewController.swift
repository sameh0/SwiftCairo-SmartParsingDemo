//
//  ViewController.swift
//  DemoNetworking
//
//  Created by Sameh sayed on 8/22/18.
//  Copyright © 2018 Sameh sayed. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    lazy var textView:UITextView! =
    {
        let txtView = UITextView(frame: view.frame)
        txtView.frame.origin.y += 60
        txtView.text = "No Data"
        return txtView
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(textView)
        
        NetworkManager.makeRequest(parameters: nil, url: "https://api.myjson.com/bins/l0h7c")
        {
            (response:APIResponse<User>?) in
            
            guard let response = response?.data else
            {
                print("No data")
                return
            }
            
            self.textView.text = "username:\(response.username) \n age:\(response.age)"
            
            print(response)
        }
        
    }
}
