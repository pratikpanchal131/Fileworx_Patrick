//
//  FWLoginVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MBProgressHUD

class FWLoginVC: UIViewController {
    
//  MARK: -
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginAsGuest: UIButton!
    
    var amutArrayData : [Any]?
    
    var objMobileSettingModel : FWMobileSetting?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderColor = UIColor.white.cgColor
        
        
        print(self.test("Panchal"))
    }
 
    @IBAction func btnLoginClicked(_ sender: Any) {
     

        let objWeb:WebService = WebService()
        
//        let aDict:[String:Any] = ["page_name":strPageName];
        
        objWeb.callWebService("http://212.118.26.115/FileworxMobileServer/api/Application/MobileSettings",aView:self.view,  param: nil) { json in
            
            debugPrint(json)
            
            print(json["RestResponse"])
            self.objMobileSettingModel =  FWMobileSetting(json: json)
            
            
            print("Message is \(self.objMobileSettingModel?.message)")
            print("Message is \(self.objMobileSettingModel?.data?.globalMobileSetttings?.allowAnonymousAccess)")
        
        }
  
        
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
        
        let controller = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    @IBAction func btnLoginAsGuestClicked(_ sender: Any) {
    }
 
    
    func test(_ pratik:String) -> String{
        
        return "Name is " + pratik
    }
    
}
