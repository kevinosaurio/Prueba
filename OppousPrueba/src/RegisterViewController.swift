//
//  RegisterViewController.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate
{
    
    //Enum:
    
    enum PresentView
    {
        case editing
        case registering
    }

    //MARK: IBOutlets:
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var editingView: UIView!
    @IBOutlet var loadingView: UIView!
    
    //MARK: UIView Life Cycle:
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Touch Events:
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    //MARK: Functions:
    
    func switchToView(viewcase:PresentView)
    {
        switch viewcase
        {
            case .editing:
                loadingView.hidden = true
                editingView.hidden = false
            case .registering:
                loadingView.hidden = false
                editingView.hidden = true
        }
    }
    
    //MARK: Actions:
    
    @IBAction func register(sender: UIButton)
    {
        //Check the TextFields
        if userNameTextField.text!.isEmpty
        {
            userNameTextField.shakeAnimate()
        }
        else if emailTextField.text!.isEmpty
        {
            emailTextField.shakeAnimate()
        }
        else if passwordTextField.text!.isEmpty
        {
            passwordTextField.shakeAnimate()
        }
        else
        {
            switchToView(.registering)
            WebServicesManager.callRegisterRequest()
            
        }
    }
}
