//
//  ViwControllerViewModel.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit
import SwiftSpinner
import MessageUI

class ViewControllerViewModel: NSObject {
    
    weak var weakSelf :  UIViewController?
    let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
    
    private var apiWS : APIEndpoints?
    
    override init() {
        super.init()
        self.apiWS = APIEndpoints()
    }
    
    /// This function have a local reference for ViewController `vc`.
    ///
    /// ```
    /// createView() // Save the viewController that call the class
    /// ```
    ///
    /// - Warning: The viewController is saved with weak reference.
    /// - Parameter vc: The VC that is able to show alerts and other visual components.
    /// - Returns: Nothing
    public func createView(_ vc: UIViewController){
               
        weakSelf = vc
    }
    
    /// This function give the user name `name`.
    ///
    /// ```
    /// getUSerName() // Return the developer name
    /// ```
    ///
    /// - Warning: This method allways return the same value
    /// - Parameter nothing: Nothis parameters need
    /// - Returns: The developer name
    func getUSerName() -> String {
        return "Gersaín Aguilar Pardo"
    }
    
    /// This function set the gesture and information for the label `lblDeveloperPhone`.
    ///
    /// ```
    /// setFuncionalityLabelPhone() // Return nothing
    /// ```
    ///
    /// - Warning: This method add gesture and underline that the label that you send in parameters
    /// - Parameter UILabel: The UILabel that you pass in parameters
    /// - Returns: Nothing
    
    func setFuncionalityLabelPhone(_ lblDeveloperPhone: UILabel){
        
        lblDeveloperPhone.text  = "+52 55 8425 0295"
        
        
        let underlineAttributedString = NSAttributedString(string: "+52 55 8425 0295", attributes: underlineAttribute)
        
        lblDeveloperPhone.attributedText = underlineAttributedString
        
        let tapGesturePhone = UITapGestureRecognizer(target: self, action: #selector(handleTapPhone))
        tapGesturePhone.numberOfTapsRequired = 1
        lblDeveloperPhone.addGestureRecognizer(tapGesturePhone)
    }
    
    /// This function set the gesture and information for the label `lblDeveloperEmail`.
    ///
    /// ```
    /// lblDeveloperEmail() // Return nothing
    /// ```
    ///
    /// - Warning: This method add gesture and underline that the label that you send in parameters
    /// - Parameter UILabel: The UILabel that you pass in parameters
    /// - Returns: Nothing
    
    func setFuncionalityLabelEmail(_ lblDeveloperEmail: UILabel){
        
        lblDeveloperEmail.text  = "gersain.aguilar.pardo@gmail.com"
        
        let underlineAttributedStringEmail = NSAttributedString(string: "gersain.aguilar.pardo@gmail.com", attributes: underlineAttribute)
        lblDeveloperEmail.attributedText = underlineAttributedStringEmail
        
        let tapGestureEmail = UITapGestureRecognizer(target: self, action: #selector(handleTapEmail))
        tapGestureEmail.numberOfTapsRequired = 1
        lblDeveloperEmail.addGestureRecognizer(tapGestureEmail)
    }
    
    /// This function handle the event and call to developer number `sender`.
    ///
    /// ```
    /// handleTapPhone() // Return nothing
    /// ```
    ///
    /// - Warning: This method execute a call phone to developer number
    /// - Parameter UITapGestureRecognizer: The sender that receive is the UIElement that handle the method
    /// - Returns: Nothing
    
    @objc private func handleTapPhone(sender: UITapGestureRecognizer) {
        
        print("Phone")
        
        if let url = NSURL(string: "tel://+525584250295") {
            
            if UIApplication.shared.canOpenURL(url as URL){
             
                UIApplication.shared.open(url as URL, options: [:]) { (success) in
                
                    if success{
                        print("success")
                    }
                }
            }
            else{
                
                let alert = UIAlertController(title: "Justo App", message: "Call phone not allowed in this device", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                
                weakSelf!.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    /// This function handle the event to send a email to the developer.
    ///
    /// ```
    /// handleTapEmail() // Return nothing
    /// ```
    ///
    /// - Warning: This method start the MFMailComposeViewController for send a email to developer
    /// - Parameter UITapGestureRecognizer: The sender that receive is the UIElement that handle the method
    /// - Returns: Nothing
    
    @objc private func handleTapEmail(sender: UITapGestureRecognizer) {
        
        print("Email")
        
        if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = nil
                mail.setToRecipients(["gersain.aguilar.pardo@gmail.com"])
                mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

                weakSelf!.present(mail, animated: true)
            
            } else {
                
                let alert = UIAlertController(title: "Justo App", message: "Email account doesn´t exist or doesn´t allowed permission", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                
                weakSelf!.present(alert, animated: true, completion: nil)

            }
    }
    
    /// This function start animation  for wait the process to download information and execute the WS to RandomAPI
    ///
    /// ```
    /// getRandomUserDataViewModel() // Return nothing
    /// ```
    ///
    /// - Warning: This method start the MFMailComposeViewController for send a email to developer
    /// - Parameter Nothing: Not parameters needed
    /// - Returns: Nothing
    
    public func getRandomUserDataViewModel(){
        
        SwiftSpinner.show("Downloading information...")
        
        apiWS?.getRandomUserData(completion: { (responseDict, error) in
            
            if responseDict != nil
            {
                SingletonSession.shared().userRandomData = responseDict!
             
                DispatchQueue.main.async {
                    SwiftSpinner.hide()
                }
            }
            else
            {
                DispatchQueue.main.async {
                    
                    SwiftSpinner.show("An error ocurred in request :( ", animated: false)
                    let deadlineTime = DispatchTime.now() + .seconds(3)
                    
                    DispatchQueue.main.asyncAfter(deadline: deadlineTime)
                    {
                        SwiftSpinner.hide()
                    }
                }
            }
        }) 
    }
}
