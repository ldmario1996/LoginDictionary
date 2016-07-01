//
//  ViewController.swift
//  LoginDictionary
//
//  Created by Thang Le on 6/22/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//
// bai tap ve nha:  nut liet ke danh sach tai khoan user, nut tao tai khoan( neu user da ton tai khong duoc tao them nua)
// username va password bien mat khi nhan vao(ok)
// lam mo background(ok)
// users.removeall or removevalueforkey,
// them nut them tai khoan, sua tai khoan, xoa tai khoan.
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var label_info: UILabel!
    var users: NSMutableDictionary = ["nguyenvantu": "123", "nonghoangthai":"khongbiet", "techmaster":"1"]
    // key and value
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func button_login(sender: AnyObject) {
        
        if let password = users[tf_user.text!] {
            if password as! String == tf_password.text!{
                label_info.alpha = 1
                label_info.text = "Dang nhap thanh cong"
            }
            else {
                label_info.alpha = 1
                label_info.text = "Mat khau khong chinh xac"
            }
        }
        else{
            label_info.alpha = 1
            label_info.text = "Tai khoan khong ton tai"
        }
    }
    @IBAction func button_generate(sender: UIButton) {
        label_info.alpha = 1;
        label_info.text = String(users.allKeys)
    }
    @IBAction func button_addaccount(sender: UIButton) {
        if let password = users[tf_user.text!]{
            label_info.text = "Tai khoan da ton tai"
        }
        else {
            label_info.alpha = 1
            label_info.text = "Ban da them tai khoan thanh cong"
            users.setValue(tf_password.text!, forKey: tf_user.text!)
        }
    }
    @IBAction func button_changepass(sender: UIButton) {
        if let password = users[tf_user.text!] {
           
                label_info.alpha = 1
                label_info.text = "Ban da thay doi mat khau thanh cong"
                users.setValue(tf_password.text!, forKey: tf_user.text!)
                print(users)
        
        }
        
    }
    @IBAction func button_del(sender: UIButton) {
        if let password = users[tf_user.text!]{
                label_info.alpha = 1
                label_info.text = " Ban da xoa tai khoan thanh cong"
                users[tf_user.text!] = nil
                users.removeObjectForKey(tf_password!)
        }
            else{
                label_info.alpha = 1
                label_info.text = "Khong the xoa duoc tai khoan"
            }
        }
        

    }
