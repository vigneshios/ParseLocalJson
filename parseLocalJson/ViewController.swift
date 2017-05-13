//
//  ViewController.swift
//  parseLocalJson
//
//  Created by vignesh on 5/9/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else {return}
        
        let url = URL(fileURLWithPath: path)
        
        do {
       
            let data = try Data(contentsOf: url)
            print(data)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
            
            guard let users = json as? [Any] else { return }
            print(users)
            
            
            for user in users {
                guard let userDict = user as? [String: Any] else { return }
                guard let userID = userDict["id"] as? Int else {return}
                guard let name = userDict["name"] as? String else {return }
                
                guard let company = userDict["company"] as? [String : Any] else { return}
                
                guard let companyName = company["name"] as? String else {return}
            
            
                
                print("UserID=\(userID)")
                print("")
                print("Employee Name = \(name)")
                print("")
                print("Company name = \(companyName)")
                print("")
            
            }
            
            
            
            
            
            
        }
        catch{
            print(error.localizedDescription)
        }
        
        
        
    }


}

