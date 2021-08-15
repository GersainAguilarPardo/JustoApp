//
//  ProfileViewController.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserAddress: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserContactInformation: UILabel!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblUserLatLong: UILabel!
    
    var profileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileViewModel.generateData()
        
        lblUserName.text                = profileViewModel.name
        lblUserAddress.text             = profileViewModel.adrress
        lblUserEmail.text               = profileViewModel.email
        lblUserContactInformation.text  = profileViewModel.contactData
        lblUserLatLong.text             = profileViewModel.latLong
        
        profileViewModel.loadImage(imgProfilePicture)
    }
}
