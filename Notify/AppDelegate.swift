//
//  AppDelegate.swift
//  Notify
//
//  Created by Higher Visibility on 02/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.alert,UNAuthorizationOptions.sound]) {
            
            result,error in
            
            if result == true{
                
              print("user has authorized user notification")
            UNUserNotificationCenter.current().delegate = self
                
              }
            }
        self.setCategoryInNotification(action: "FirstAction", action2: "SecondAction", category: "MainCategory")
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "actionidentifier1"{
            
            print("Identifier1")
            
        }
        else if response.actionIdentifier == "actionidentifier2"{
            
             print("Identifier2")
        }
        completionHandler()
    }
    
    func trigerNotification(){
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = "testing"
        content.body = "it is my first notification please drag it down "
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "MainCategory"
        guard let path = Bundle.main.path(forResource: "Butler", ofType: "jpg")else{return}
        let url = URL(fileURLWithPath: path)
        do{
            let attachments = try UNNotificationAttachment(identifier: "logo", url: url, options: nil)
            content.attachments = [attachments]
            
        }catch let error{
            
            print(error.localizedDescription)
        }
        let request = UNNotificationRequest(identifier: "firstrequest", content: content, trigger: triger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let err = error{
                
              print(err.localizedDescription)
                
          }
        }
        
    }
    
    func setCategoryInNotification(action:String,action2:String,category:String){
        
        let un_action1 = UNNotificationAction(identifier: "actionidentifier1", title: action, options: [])
        let un_action2 = UNNotificationAction(identifier: "actionidentifier2", title: action2, options: [])
        let cat = UNNotificationCategory(identifier: category, actions: [un_action1,un_action2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([cat])
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

