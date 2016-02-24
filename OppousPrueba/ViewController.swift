//
//  ViewController.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func prueba(sender: AnyObject)
    {
        // prepare json data
        
        do
        {
        
        let json = [ "usrnm":"Kevinosaurio" , "email": "kevinbolivar05@gmail.com", "passwd":"prueba","lang":"es","dvc":"12345","apikey_id":"12345"]
            
        
        let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
            
        //let postString = "usrnm=Kevinosaurio&email=kevinbolivar05@gmail.com&passwd=prueba&lang=es&dvc=a &apikey_id=1"
        
        // create post request
        let url = NSURL(string: "https://testapi.playfan.me/v3/usrs")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        //request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // insert json data to the request
        request.HTTPBody = jsonData
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data,response,error in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            do {
                let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                
                print("Result -> \(result)")
                
            } catch {
                print("Error -> \(error)")
            }
        }
        
        task.resume()
            
        }
        catch {
            print(error)
        }
    }

}

