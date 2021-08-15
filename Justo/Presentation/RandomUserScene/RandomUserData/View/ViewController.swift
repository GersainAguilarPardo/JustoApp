//
//  ViewController.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblDeveloperName: UILabel!
    @IBOutlet weak var lblDeveloperEmail: UILabel!
    @IBOutlet weak var lblDeveloperPhone: UILabel!
    
    var onlyOne = true
    
    let viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.lblDeveloperEmail = lblDeveloperEmail
        viewModel.lblDeveloperPhone = lblDeveloperPhone
        viewModel.lblDeveloperName = lblDeveloperName
        
        viewModel.createView(self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if onlyOne {
         
            callToGetRandomUserData()
            onlyOne = false
        }
    }
    
    func callToGetRandomUserData(){
        
        viewModel.getRandomUserDataViewModel(self)
    }
}

