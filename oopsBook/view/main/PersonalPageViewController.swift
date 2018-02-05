//
//  MainViewController.swift
//  oopsBook
//
//  Created by Yaroslav Movchan on 03.02.2018.
//  Copyright © 2018 Yaroslav Movchan. All rights reserved.
//

import UIKit
import GoogleSignIn

class PersonalPageViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = CoreDataManager.instance.getUser().0
        // Do any additional setup after loading the view.
    }
  
    @IBAction func logOut(_ sender: Any) {
        print("log out")
        GIDSignIn.sharedInstance().signOut()
        var mainView: UIStoryboard!
        mainView = UIStoryboard(name: "Login", bundle: nil)
        if let viewcontroller = mainView.instantiateViewController(withIdentifier: "login") as? LoginViewController {
            print("transition")
            self.present(viewcontroller, animated: true, completion: nil)
        }
    }
}
