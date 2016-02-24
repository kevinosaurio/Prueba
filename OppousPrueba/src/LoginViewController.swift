//
//  LoginViewController.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{

    //MARK: IBOutlets:
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: UIView Life Cycle:
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Touch Events:
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    //MARK: Actions:
    
    @IBAction func login(sender: UIButton)
    {
        if emailTextField.text!.isEmpty
        {
            emailTextField.shakeAnimate()
        }
        else if passwordTextField.text!.isEmpty
        {
            passwordTextField.shakeAnimate()
        }
        else
        {
            performSegueWithIdentifier("sw_Users", sender: self)
        }

    }
    
}
