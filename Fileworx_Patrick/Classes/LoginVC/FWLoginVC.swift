//
//  FWLoginVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class FWLoginVC: UIViewController {
    
//  MARK: -
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginAsGuest: UIButton!
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderColor = UIColor.white.cgColor
        
        
    }
 
    @IBAction func btnLoginClicked(_ sender: Any) {
        
        
        let controller = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    @IBAction func btnLoginAsGuestClicked(_ sender: Any) {
    }
    
}
