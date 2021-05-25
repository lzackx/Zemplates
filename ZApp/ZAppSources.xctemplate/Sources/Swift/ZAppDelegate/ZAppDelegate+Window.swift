//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit


extension ZAppDelegate {
	
	func setupWindow() {
		self.resetWindow()
	}
	
	func resetWindow() {
		self.window = self.createMainWindow()
		self.window!.makeKeyAndVisible()
	}
	
	// MARK: - File Private Methods
	fileprivate func createMainWindow() -> UIWindow {
		let window: UIWindow = UIWindow()
		window.backgroundColor = UIColor.cyan
		window.rootViewController = ZViewController()
		return window
	}
	
}

