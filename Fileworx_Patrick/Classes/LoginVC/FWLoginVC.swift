//
//  FWLoginVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftyJSON
import Toast_Swift


class FWLoginVC: UIViewController {
    
    //  MARK: -
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginAsGuest: UIButton!
    
    let objWeb:WebService = WebService()
    
    var amutArrayData : [Any]?
    var objMobileSettingModel : FWMobileSettingModel?
    var objAvailableModules : FWAvailableModules?
    var objUserModel : FWUserModel?
    
    var aMutArrayAvailableModule:[Any]?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderColor = UIColor.white.cgColor
        
        self.txtUserName.text = "root"
        self.txtPassword.text = "root"
        
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        

        
        self.CallAPILogin()
        
        
        
        
        
        
    }
    @IBAction func btnLoginAsGuestClicked(_ sender: Any) {
    }
    
}


extension FWLoginVC{
    
    func APICall()
    {
        let json: [String: Any] = ["userName":"root", "Password":"root","LastLoginLanguageID":"-1","AuthenticationType":"0"];
        
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            // create post request
            let url = NSURL(string: "http://212.118.26.115/FileworxMobileServer/api/Account/Login")!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                
                do {
                    //                    let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                    
                    let json = JSON(data: data!)
                    
                    self.objUserModel  = FWUserModel(json:json)
                    
                    print("Result -> \(self.objUserModel?.data)")
                    
                    //                    if self.objUserModel?.result == 0
                    //                    {
                    //                        let controller = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    //                        self.navigationController?.pushViewController(controller, animated: true)
                    //
                    //                    }else
                    //                    {
                    //
                    //                    }
                    //
                    
                } catch {
                    print("Error -> \(error)")
                }
            }
            
            task.resume()
            
            
            
        } catch {
            print(error)
        }
    }
    
    
    
    func CallAPIMobileSetting()
    {
        objWeb.callWebService("http://212.118.26.115/FileworxMobileServer/api/Application/MobileSettings",aView:self.view,  param: nil) { json in
            
            debugPrint(json)
            
            print(json["RestResponse"])
            self.objMobileSettingModel =  FWMobileSettingModel(json: json)
            
            
            print("Message is \(self.objMobileSettingModel?.message)")
            print("Message is \(self.objMobileSettingModel?.data?.globalMobileSetttings?.allowAnonymousAccess)")
            
        }
        
    }
    
    
    func CallAPILogin(){
        
        let json: [String: Any] = ["userName": self.txtUserName.text!, "Password":self.txtPassword.text!,"LastLoginLanguageID":"-1","AuthenticationType":"0"];
        
        
        
        WebService().callWebServiceWithURLSession("http://212.118.26.115/FileworxMobileServer/api/Account/Login" , param: json) { json
            in
            
            print("json \(json)")
            self.objUserModel  = FWUserModel(json:json)
            
            
            
            print("Result -> \((self.objUserModel?.data)!)")
            
            if self.objUserModel?.result == 0
            {
                
                UtilityUserDefault().setUDObject(ObjectToSave: self.objUserModel?.message as AnyObject?, KeyToSave: "user")
                UtilityUserDefault().setUDBool(true,key: "pratik")

                let controller = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else
            {
                self.view.makeToast((self.objUserModel?.message)!, duration: 3.0, position: .bottom)
            }
            
        }
    }
    
    func CallAPIAlmofireRequest()
    {
        //        Alamofire.request("http://services.groupkt.com/country/get/all").responseJSON { response in
        //
        //
        //            let JSON = response.result.value as! Dictionary<String,AnyObject>
        //
        //            let aDictData = JSON["RestResponse"] as! Dictionary<String,AnyObject>
        //            self.amutArrayData  = aDictData["result"] as! [Any]?
        //
        //
        //            print("My Array is \(self.amutArrayData)")
        //
        //        }
    }
}
