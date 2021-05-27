//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit


@main
class ZAppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Properties
	var window: UIWindow?

	// MARK: - Life Cycle
	// MARK: - Launch
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		#if DEBUG
		self.setupDoraemonKit()
		#endif
		self.setupEnvironment()
		self.setupRouter()
		self.setupRequest()
		self.setupWindow()
		self.setupPopup()
		
		return true
	}
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		return true
	}

	func applicationDidFinishLaunching(_ application: UIApplication) {
		
	}
	
	// MARK: - Foreground / Background
	func applicationWillResignActive(_ application: UIApplication) {
		
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		
	}
	
	// MARK: - Terminate
	func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
		
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		
	}
		
	// MARK: - Notification
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		
	}
	
	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		
	}
	
	// MARK: - Open URL
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		
		return true
	}
}

