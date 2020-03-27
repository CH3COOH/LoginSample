//
//  ViewController.swift
//  LoginSample
//
//  Created by KENJI WADA on 2019/09/14.
//  Copyright © 2019 KENJI WADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.placeholder = "ユーザーID"
        if #available(iOS 11.0, *) {
            usernameTextField.textContentType = .username
        } else {
            usernameTextField.textContentType = .nickname
        }
        passwordTextField.placeholder = "パスワード"
        if #available(iOS 11.0, *) {
            passwordTextField.textContentType = .password
        } else {
            passwordTextField.textContentType = .none
        }
        
        button.setTitle("ログインする", for: .normal)

        usernameTextField.text = "ch3cooh"
        passwordTextField.text = "password"
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !password.isEmpty
            else {
                // ログイン、ダメです
                return
        }
        
        // サーバーにユーザーIDとパスワードを送って認証
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            let hasError = false //response.get()
            if hasError {
                // ログイン、ダメです
            } else {
                // 成功したし、ホーム画面へ遷移する！
                
                // ログインできたからパスワードを記録する
                SecAddSharedWebCredential("loginsample.ch3cooh.jp" as CFString, username as CFString, password as CFString, { (_) in                    
                })
            }
        }
    }
}

