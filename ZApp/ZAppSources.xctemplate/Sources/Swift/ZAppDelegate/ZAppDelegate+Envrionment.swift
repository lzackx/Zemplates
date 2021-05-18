//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit
import ZKit

extension ZAppDelegate {
	
	func setupEnvrionment() {
		self.setupProductModuleName()
	}
	
	// MARK: - file private methods
	fileprivate func setupProductModuleName() {
		ZKit.sharedZ().setConfigurationValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleName"),
											 forKey: ZConstants.ProductModuleNameKey)
	}
	
}

