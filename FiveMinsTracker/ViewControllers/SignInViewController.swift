//
//  SignInViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/19.
//

import UIKit
import KakaoSDKUser
import AuthenticationServices
import GoogleSignIn


class SignInViewController: UIViewController {
    
    // MARK: - Kakao SignIn
    @IBAction func KakaoSignInBtnTouched(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        // 카카오톡 설치되어 있는 경우 카카오톡으로 간편로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
//                    let accessToken = oauthToken?.accessToken
                    self.performSegue(withIdentifier: "SignInSuccessSegue", sender: self)
                }
            }
        }
        // 카카오톡 설치되어있지 않은 경우 카카오계정으로 로그인
        else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        self.performSegue(withIdentifier: "SignInSuccessSegue", sender: self)
                    }
                }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProviderSignInView()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Google SignIn
    @IBAction func googlesignIn(sender: Any) {
        let signInConfig = GIDConfiguration.init(clientID: "281671439415-eni64091cquhc2n02mvr5vsd1m4257ag.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            self.performSegue(withIdentifier: "SignInSuccessSegue", sender: self)

        }
    }
    
    
    // MARK: - Apple SignIn
    @IBOutlet weak var appleSignInStackView : UIStackView!
    
    func setupProviderSignInView(){
        let btn = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        btn.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.appleSignInStackView.addArrangedSubview(btn)
    }
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
}


extension SignInViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print("#1: \(userIdentifier)")
            print("#2: \(String(describing: fullName))")
            print("#3: \(String(describing: email))")
        
        case let passwordCredential as ASPasswordCredential:
            let userName = passwordCredential.user
            let password = passwordCredential.password
            print("#4: \(userName)")
            print("#5: \(password)")

        default:
            break
        }
        self.performSegue(withIdentifier: "SignInSuccessSegue", sender: self)

    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
    
}

extension SignInViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
