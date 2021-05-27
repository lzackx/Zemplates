//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit


extension ZAppDelegate {
	
	func setupWindow() {
		self.activateMainWindow()
	}
	
	func resetWindow() {
		self.window = self.createMainWindow()
		self.window!.makeKeyAndVisible()
	}
	
	func activateMainWindow() {
		if let mw = self.window {
			mw.makeKeyAndVisible()
		} else {
			self.resetWindow()
		}
	}
	
	// MARK: - File Private Methods
	fileprivate func createMainWindow() -> UIWindow {
		let window: UIWindow = UIWindow()
		window.backgroundColor = UIColor.cyan
		window.rootViewController = ZViewController()
		return window
	}
	
}

