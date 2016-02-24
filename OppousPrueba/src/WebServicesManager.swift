//
//  WebServicesManager.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

class WebServicesManager: NSObject
{
    static let baseUrl = "https://testapi.playfan.me"
    static let registerUrl = "/v3/usrs"

    static private func postRequest(json:[String:NSObject],urlString:String)
    {
        do
        {
            let postString = "usrnm=Kevinosaurio&email=kevinbolivar05@gmail.com&passwd=prueba&lang=en&dvc=iPhone 4 &apikey_id=552c1539155370e229eb56dd"
            // Compose a query string
            
            let data = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
            
            let url = NSURL(string: baseUrl + urlString)
            let request = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            //request.HTTPBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task =  NSURLSession.sharedSession().dataTaskWithRequest(request)
            {
                data,response,error in
                    
                if error != nil
                {
                    print(error!.localizedDescription)
                    return
                }
                do
                {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    
                    print("Result -> \(result)")
                    
                } catch
                {
                    print("Error -> \(error)")
                }
            }
            
            task.resume()
            
            
        }
        catch // error in Json
        {
            print(error)
        }
    }
    
    static func callRegisterRequest()
    {
        let json = [ "usrnm":"Kevinosaurio", "email": "kevinbolivar05@gmail.com", "passwd":"prueba","lang":"es","dvc":"iPhone 4s","apikey_id":"552c1539155370e229eb56dd"]
        postRequest(json, urlString: registerUrl)
    }
}
