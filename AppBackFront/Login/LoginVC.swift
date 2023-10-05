//
//  ViewController.swift
//  AppBackFront
//
//  Created by Caio Fabrini on 15/09/22.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyBoard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFildsDelegate(delegate: self)
        isEnableLoginButton(isEnable: false)
    }
    
    func validateTextField() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && 
            (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableLoginButton(isEnable: true)
        } else {
            isEnableLoginButton(isEnable: false)
        }
    }
    
    func isEnableLoginButton(isEnable: Bool) {
        if isEnable {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.subLoginImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.4
        }
    }
    
    
}

extension LoginVC: LoginScreenProtocols {
    func tappedLoginButton() {
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("Success")
            }
        })
    }
    
    func tappedRecoverPasswordButton() {
        print("Cheguei na VC também")
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth  = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
                
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 1
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
