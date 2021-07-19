//
//  SignUpViewController.swift
//  FiveMinsTracker
//
//  Created by Johyeon Yoon on 2021/07/19.
//

import UIKit
import KakaoSDKUser

class SignUpViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
