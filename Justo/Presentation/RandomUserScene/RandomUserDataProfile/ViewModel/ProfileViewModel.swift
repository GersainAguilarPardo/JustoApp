//
//  ProfileViewModel.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit
import KFSwiftImageLoader

class ProfileViewModel: NSObject {
    
    var name            = ""
    var adrress         = ""
    var email           = ""
    var contactData     = ""
    var latLong         = ""
    var imageURL        = ""
    
    func generateData(){
        
        let userNameData = SingletonSession.shared().userRandomData["name"] as! NSDictionary
        
        name = ((userNameData["title"] as! String)+" ")
        name.append((userNameData["first"] as! String)+" ")
        name.append(userNameData["last"] as! String)
                
        let userAddresData = SingletonSession.shared().userRandomData["location"] as! NSDictionary
        
        adrress = "Calle: \((userAddresData["street"] as! NSDictionary)["name"] ?? "") #\((userAddresData["street"] as! NSDictionary)["number"] ?? "") \nCiudad: \(userAddresData["city"] as! NSString) \(userAddresData["state"] as! NSString) \nPais: \(userAddresData["country"] as! NSString)"
        
        
        email = (SingletonSession.shared().userRandomData["email"] as! String)
        
        
        let userPictureData = SingletonSession.shared().userRandomData["picture"] as! NSDictionary
        
        
        imageURL = userPictureData["large"] as! String
        
        
        
        contactData = "Tel: \(SingletonSession.shared().userRandomData["phone"] as! String) \nCel: \(SingletonSession.shared().userRandomData["cell"] as! String)"
        
        let latLongData = userAddresData["coordinates"] as! NSDictionary
        
        latLong =  "Random lat,long: (\(latLongData["latitude"] ?? ""),\(latLongData["longitude"] ?? ""))"
    }
    
    func loadImage(_ imgProfilePicture: UIImageView){
        
        imgProfilePicture.loadImage(urlString: imageURL, placeholder: UIImage(named: "RandomUser")) {
            (success, error) in
            
            
            // 'success' is a 'Bool' indicating success or failure.
            // 'error' is an 'Error?' containing the error (if any) when 'success' is 'false'.
        }
    }
}
