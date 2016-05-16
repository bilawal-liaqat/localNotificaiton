//
//  AppDelegate.swift
//  localNotification
//
//  Created by Bilawal Liaqat on 16/05/2016.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        application.registerUserNotificationSettings(UIUserNotificationSettings (forTypes: UIUserNotificationType.Alert, categories: nil))
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        setLocalNotificaiton("Notify", body: "applicationDidEnterBackground")

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    setLocalNotificaiton("Notify", body: "applicationWillEnterForeground")
    
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
    
        
        UIAlertView(title: notification.alertTitle, message: notification.alertBody, delegate: nil, cancelButtonTitle: "OK").show()

        
        
    }
    
    
    
    func setLocalNotificaiton(title : String , body : String){
        
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = title
        localNotification.alertBody = body
     //   localNotification.fireDate = NSDate()
        localNotification.fireDate = NSDate(timeIntervalSinceNow:0)

        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.timeZone = NSTimeZone.defaultTimeZone();
        localNotification.applicationIconBadgeNumber = 1;
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }

}

