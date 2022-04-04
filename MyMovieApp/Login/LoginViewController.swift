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
        switch canLogin() {
        case .logSuccess:
            let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        case .invalid:
            let alert = UIAlertController(title: "Error", message: "Nombre de usuario o contraseña incorrecta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func canLogin() -> ValidateLog {
        let user = UserData.user
        let pass = UserData.password
        
        if userTextField.text == user && passTextField.text == pass {
            return .logSuccess
        } else {
            return .invalid
        }
        
    }
    
    enum ValidateLog: String {
        case logSuccess
        case invalid
    }
    
}

