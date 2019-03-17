//
//  EmailSignupVC.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 16/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
import Hero
import Alamofire

class EmailSignupVC: UIViewController {
    
    //Textfields
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfields()
        
    }
    
    // Ui Setup Code for the Textfields
    fileprivate func setupTextfields() {
        // Email TextField
        EmailTextField.backgroundColor = .black
        EmailTextField.setBottomWhiteBorder()
        EmailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        // Password TextField
        PasswordTextField.backgroundColor = .black
        PasswordTextField.setBottomWhiteBorder()
        PasswordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        // Confirm Password TextField
        ConfirmPasswordTextField.backgroundColor = .black
        ConfirmPasswordTextField.setBottomWhiteBorder()
        ConfirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // Dismiss Keyboard on Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Go Back
    // TODO: Save State in Textfields to prevent accidental deletion.
    @IBAction func BackButton(_ sender: Any) {
        toLoginVC() // Transition Back
    }
    
    
    // Continue Button on Keyboard when Email is active.
    @IBAction func EmailContinue(_ sender: Any) {
        EmailTextField.resignFirstResponder()
        PasswordTextField.becomeFirstResponder()
    }
    
    // Continue Button on Keyboard when Password is active.
    @IBAction func PasswordContinue(_ sender: Any) {
        PasswordTextField.resignFirstResponder()
        ConfirmPasswordTextField.becomeFirstResponder()
    }
    
    @IBAction func ConfirmPasswordContinue(_ sender: Any) {
        Signup()
    }
    
    
    @IBAction func SignupButton(_ sender: Any) {
        self.view.endEditing(true)
        Signup()
    }
    
    func Signup() {
        print("Signing Up")
    }
    
    
    @IBAction func Login(_ sender: Any) {
        // Transition to the SignupVC
        toEmailLoginVC()
    }
    
    fileprivate func toEmailLoginVC() {
        let LoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmailLoginVC") as! EmailLoginVC
        LoginVC.hero.modalAnimationType = .fade
        self.hero.replaceViewController(with: LoginVC)
    }
    
    // Transitions back to the main LoginVC
    fileprivate func toLoginVC() {
        let LoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        LoginVC.hero.modalAnimationType = .slide(direction: .right)
        self.hero.replaceViewController(with: LoginVC)
    }
    
    
}
