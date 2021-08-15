//
//  APIEndpoints.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import Alamofire

class APIEndpoints : NSObject {
    
    func getRandomUserData(completion : @escaping (NSDictionary?, NSError?) -> ()){
        
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        AF.request("https://randomuser.me/api/").responseJSON(queue: utilityQueue)
        {
            response in switch response.result
            {
            
                case .success(let JSON):

                    let response = JSON as! NSDictionary
                    let userData = response["results"] as! NSArray
                    let importantData = userData[0] as! NSDictionary
                    
                    completion(importantData, nil)

                case .failure(let error):
                    completion(nil,error as NSError)
            }
        }
    }
}
