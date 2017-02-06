//
//  UIViewController+Navigation.swift
//  PilotPlantSwift
//
//  Created by lingostar on 2014. 10. 28..
//  Copyright (c) 2014년 lingostar. All rights reserved.
//

import UIKit
import ObjectiveC

private var backButtonHidden : Bool = false
private var tapKBDismiss : Bool = false

var window: UIWindow?

public extension UIViewController {
    
    @IBAction func modalDismiss(_ sender : AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modalDismissPush(_ sender : AnyObject){
        var destVC : UIViewController! = nil
        if let presentingVC = self.presentingViewController as? UITabBarController {
            if let tempVC = presentingVC.selectedViewController as? UINavigationController {
                destVC = tempVC.topViewController
            } else {
                destVC = self.presentingViewController
            }
        } else if let presentingVC = self.presentingViewController as? UINavigationController {
            destVC = presentingVC.topViewController
        } else {
            destVC = self.presentingViewController
        }
        
        destVC.performSegue(withIdentifier: "ModalDismissPush", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func navigationBack(_ sender : AnyObject){
        if self.navigationController != nil {
            navigationController!.popViewController(animated: true)
        }
    }
    
    @IBAction func navigationBackToRoot(_ sender : AnyObject){
        if self.navigationController != nil {
            navigationController!.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func keyboardDismiss(_ sender: AnyObject) {
        for view in self.view.subviews {
            view.resignFirstResponder()
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: { imageP in
            
        })
    }
    
    @IBInspectable var backHidden : Bool {
        get {
            return self.navigationItem.hidesBackButton
        }
        set (newValue){
            self.navigationItem.hidesBackButton = newValue
        }
        
    }
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

            return true
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
    

















