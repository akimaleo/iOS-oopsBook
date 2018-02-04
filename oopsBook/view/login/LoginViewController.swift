//
//  ViewController.swift
//  oopsBook
//
//  Created by Yaroslav Movchan on 03.02.2018.
//  Copyright © 2018 Yaroslav Movchan. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var oauthGoogleButton: GIDSignInButton!
    
    @IBAction func onOauthGoogle(_ sender: Any) {
        oauthGoogleButton.sendActions(for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //IS AUTHORIZED BY GOOGLE
        if GIDSignIn.sharedInstance().hasAuthInKeychain(){
            launchMainActivity()
        }
    }
    private func launchMainActivity(){
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = mainView.instantiateViewController(withIdentifier: "main") as? UITabBarController {
            self.present(viewcontroller, animated: true, completion: nil)
        }
    }
}
