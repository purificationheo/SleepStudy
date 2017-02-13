//
//  AppDelegate.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 18..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let directorys : [String]? = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        saveData()
        
        if (directorys != nil){
            let dictionary = getDocumentsDirectory(); //documents directory
            
            
            //  Create and insert the data into the Plist file  ....
            let plistfile = "myPlist.plist"
            let plistpath = dictionary.appendingPathComponent(plistfile);
            
            //Reading Plist file
            print("Plist file found")
                
            let resultDictionary = NSMutableDictionary(contentsOfFile: plistpath.path)
            print(resultDictionary?.description as Any)
            
        }
        else {
            print("directory is empty")
        }
        return true
    }

    func saveData(){
        let directorys : [String]? = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        if (directorys != nil){
            let dictionary = getDocumentsDirectory(); //documents directory
            let sub = Subject(name: "a", prof: "b", place: "c", time: [(day: 1, startTime: 1, endTime: 1)])
            
            //  Create and insert the data into the Plist file  ....
            let plistfile = "myPlist.plist"
            var myDictionary: NSMutableDictionary = ["name": sub.name]
            myDictionary["prof"] = sub.prof
            myDictionary["place"] = sub.place
            myDictionary["time"] = sub.time
            
            
            
            let plistpath = dictionary.appendingPathComponent(plistfile);
            
            myDictionary.write(toFile: plistpath.path, atomically: false)
            
        }
        else {
            print("directory is empty")
        }

    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

