//
//  AppDelegate.swift
//  masterios
//
//  Created by Qin Guan on 2019-03-13.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn
import Firebase
import FirebaseAuth
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

  var window: UIWindow?

  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if let error = error {
      let errorDict: [String: Error] = ["error": error]
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil, userInfo: errorDict)
      return
    }
    guard let authentication = user.authentication else {
      return
    }
    let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
      accessToken: authentication.accessToken)
    Auth.auth().signIn(with: credential) { res, error in
      if let error = error {
        let errorDict: [String: Error] = ["error": error]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil, userInfo: errorDict)
        return
      }
      guard let uid = res?.uid else {
        return
      }
      guard let e = res?.email else {
        return
      }
      let parameters: Parameters = [
        "uid": uid,
        "e": e
      ]
      Alamofire.request(getURL("/auth/signIn"), method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { res in
        switch res.result {
        case .success:
          if let result = res.result.value {
            let JSON = result as! NSDictionary
            guard var p = JSON["pfp"] else {return}
            guard var t = JSON["token"] else {return}
            var pfp: URL?
            var p2: String?
            var token: String?
            do {
               p2 = p as! String
               token = t as! String
            } catch {
              let errorDict: [String: Error] = ["error": error]
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil, userInfo: errorDict)
            }
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
            let user = NSManagedObject(entity: entity!, insertInto: context)
            if p2 == "/static/fadedBar.png" {
              pfp = URL(string: "https://master.cx/static/fadedBar.png")
            } else {
              pfp = URL(string: p2!)
            }
            user.setValue(token, forKey: "token")
            user.setValue(pfp, forKey: "pfp")
            do {
              try context.save()
            } catch {
              let errorDict: [String: Error] = ["error": error]
              NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil, userInfo: errorDict)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDSUCCESS.rawValue), object: nil)
          }
          return
        case .failure(let error):
          let errorDict: [String: Error] = ["error": error]
          NotificationCenter.default.post(name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil, userInfo: errorDict)
        }
      }
    }
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    // Firebase Setup
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    GIDSignIn.sharedInstance().delegate = self
    return true
  }

  @available(iOS 9.0, *)
  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
    return GIDSignIn.sharedInstance().handle(url,
      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
      annotation: [:])
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
    // Saves changes in the application's managed object context before the application terminates.
    self.saveContext()

  }


  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
    */
    let container = NSPersistentContainer(name: "masterios")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  // MARK: - Core Data Saving support

  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }


}
