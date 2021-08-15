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
        
        viewModel.createView(self)
        
        lblDeveloperName.text = viewModel.getUSerName()
        
        viewModel.setFuncionalityLabelEmail(lblDeveloperEmail)
        viewModel.setFuncionalityLabelPhone(lblDeveloperPhone)
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

