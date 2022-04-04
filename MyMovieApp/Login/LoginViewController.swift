//
//  ViewController.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 3/04/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let homeVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.cornerButton()
    }

    @IBAction func goHomeAct(_ sender: Any) {
        print("tapped")
        if canLogin() {
            let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("nombre de usuario o contraseña incorrecta")
            let alert = UIAlertController(title: "Error", message: "Nombre de usuario o contraseña incorrecta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                switch action.style {
                case .default: print("default")
                case .cancel: print("cancel")
                case .destructive: print("destructive")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func canLogin() -> Bool {
        let user = UserData.user
        let pass = UserData.password
        return true
        if userTextField.text == user && passTextField.text == pass {
            return true
        } else {
            return false
        }
        
    }
    
}

