//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit
import ZKit

extension ZAppDelegate {
	
	func setupEnvironment() {
		self.setupProductModuleName()
	}
	
	// MARK: - File Private Methods
	fileprivate func setupProductModuleName() {
		ZKit.sharedZ().setConfigurationValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleName"),
											 forKey: ZConstants.ProductModuleNameKey)
	}
	
}

