//
//  ZEnvironment.swift
//
//  Created by lzackx
//

import Foundation
import ZKit


class ZEnvironment: NSObject {
	
	// MARK: - Project Methods
	class func currentEnvironment() -> String {
		let environment: String = UserDefaults.standard.string(forKey: ZConstants.ApplicationEnvironmentKey) ?? ZConstants.ApplicationEnvironmentRelease
		return environment
	}
	
	class func updateEnvironment(environment: String) {
		if (environment == ZConstants.ApplicationEnvironmentRelease || environment == ZConstants.ApplicationEnvironmentDevelop) {
			UserDefaults.standard.setValue(environment, forKey: ZConstants.ApplicationEnvironmentKey)
		}
	}	
}
