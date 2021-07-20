//
//  SignUpViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/19.
//

import UIKit
import KakaoSDKUser
import AuthenticationServices
import GoogleSignIn
import NaverThirdPartyLogin
import Alamofire

class SignUpViewController: UIViewController {
    
    
    // MARK: - Kakao SignUp
    @IBAction func KakaoSignUpBtnTouched(_ sender: Any) {
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
                    self.performSegue(withIdentifier: "SignUpSuccessSegue", sender: self)

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
                        self.performSegue(withIdentifier: "SignUpSuccessSegue", sender: self)

                    }
                }
            
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProviderAppleSignUpView()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Google SignUp
    @IBAction func googlesignUp(sender: Any) {
        let signInConfig = GIDConfiguration.init(clientID: "281671439415-eni64091cquhc2n02mvr5vsd1m4257ag.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            self.performSegue(withIdentifier: "SignUpSuccessSegue", sender: self)

        }
    }
    
    
    // MARK: - Naver SignUp
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()

    
    @IBAction private func naverSignUpButton(_ sender: UIButton) {
      loginInstance?.delegate = self
      loginInstance?.requestThirdPartyLogin()
    }
    
    @IBAction private func naverSignOut(_ sender: UIButton) {
    loginInstance?.delegate = self
    loginInstance?.requestDeleteToken()
        
    }
    
    private func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let nickname = object["nickname"] as? String else { return }
            
            print("username: \(name)")
            print("email: \(email)")
            print("nickname: \(nickname)")
            
        }
        self.performSegue(withIdentifier: "SignUpSuccessSegue", sender: self)
    }
    
    
    
    // MARK: - Apple SignUp
    @IBOutlet weak var appleSignUpStackView : UIStackView!
    
    func setupProviderAppleSignUpView(){
        let btn = ASAuthorizationAppleIDButton(type: .signUp , style: .black)
        btn.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.appleSignUpStackView.addArrangedSubview(btn)
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


extension SignUpViewController: ASAuthorizationControllerDelegate {
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
        self.performSegue(withIdentifier: "SignUpSuccessSegue", sender: self)

    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
    
}

extension SignUpViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}



//naver signUp extenstions


extension SignUpViewController: NaverThirdPartyLoginConnectionDelegate {
  // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
  func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {

  }
  
  // 로그인에 성공했을 경우 호출
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    print("[Success] : Success Naver Login")
    getNaverInfo()
  }
  
  // 접근 토큰 갱신
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    
  }
  
  // 로그아웃 할 경우 호출(토큰 삭제)
  func oauth20ConnectionDidFinishDeleteToken() {
    loginInstance?.requestDeleteToken()
  }
  
  // 모든 Error
  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    print(error.localizedDescription)
  }
}

