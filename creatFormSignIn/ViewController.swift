//
//  ViewController.swift
//  creatFormSignIn
//
//  Created by Quan on 6/15/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_username: UITextField!
    @IBOutlet weak var tf_pasword: UITextField!
    
    var users = ["Cuong": "123", "Dat": "1", "Tien": "567"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action_Login(sender: AnyObject) {
        if let password = users[tf_username.text!] {
            if password == tf_pasword.text! {
                print("Dang nhap thanh cong")
            } else {
                print("Mat khau khong dung")
            }
            
        } else {
            print("Tai khoan khong ton tai")
            
        }
    }
    
    @IBAction func action_UList(sender: AnyObject) {
        print("Danh sach nguoi dung: ")
        for (taikhoan, matkhau) in users {
            print("\(taikhoan): \(matkhau)")
        }
    }
    
    @IBAction func action_Add(sender: AnyObject) {
        var checkUserName: Bool = true // true: duoc phep them; false : khong duoc phep them
        
        for(tendangnhap, _) in users {
            if tendangnhap == tf_username.text! {
                checkUserName = false
            }
        }
        
        if checkUserName == true && tf_username.text != "" {
            users[tf_username.text!] = tf_pasword.text!
            print("Da them nguoi dung \(tf_username.text!) : \(tf_pasword.text!) vao danh sach")
            print("Danh sach moi: ")
            for user in users {
                print("\(user.0): \(user.1)")
            }
        } else {
            print("Khong the them! Hay kiem tra lai!!")
        }
        
    }
    
    @IBAction func action_Delete(sender: AnyObject) {
        var canDelete: Bool = false
        for (tentaikhoan, _) in users {
            if tentaikhoan == tf_username.text! {
                canDelete = true
            }
        }
        
        if canDelete == true {
            users.removeValueForKey(tf_username.text!)
            print("Da xoa tai khoan : \"\(tf_username.text!)\" ra khoi danh sach")
            print("Danh sach moi: ")
            for user in users {
                print("\(user.0): \(user.1)")
            }
        } else {
            print("Tai khoan nay khong co trong danhs sach")
        }
    }
    
    @IBAction func action_Fix(sender: AnyObject) {
        var canFix: Bool = false
        
        for (tentaikhoan, _) in users {
            if tentaikhoan == tf_username.text! {
                canFix = true
            }
        }
        
        if canFix == true {
            if( users[tf_username.text!] != tf_pasword.text!){
                users[tf_username.text!] = tf_pasword.text!
                print("Da sua tai khoan : \"\(tf_username.text!)\"")
                print("Danh sach moi: ")
                for user in users {
                    print("\(user.0): \(user.1)")
                }
            } else {
                print("Mat khau khong thay doi")
            }
        } else {
            print("Tai khoan nay khong co trong danhs sach")
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }


}

