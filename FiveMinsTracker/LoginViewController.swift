//
//  LoginViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/15.
//

import UIKit
import AuthenticationServices


class LoginViewController: UIViewController {
    
    @IBOutlet weak var SignUpViewController : UIView!
    @IBOutlet weak var SignInViewController : UIView!
    
    
    var appleSignInButton: UIStackView!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
//    func setAppleSignInButton() {
//        let authorizationButton = ASAuthorizationAppleIDButton(type: .signUp, style: .whiteOutline)
//        authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
//        self.appleSignInButton.addArrangedSubview(authorizationButton)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
