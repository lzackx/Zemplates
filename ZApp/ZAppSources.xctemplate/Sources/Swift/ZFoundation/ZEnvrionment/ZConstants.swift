//
//  ZConstants.swift
//
//  Created by lzackx
//

import Foundation


struct ZConstants {
	// MARK: - Application Environment
	static let ApplicationEnvironmentKey = "ApplicationEnvironmentKey"
	static let ApplicationEnvironmentRelease = "ApplicationEnvironmentRelease"
	static let ApplicationEnvironmentDevelop = "ApplicationEnvironmentDevelop"
	// MARK: - Router
	static let AppScheme: String = "zapp"
	static let ProductModuleNameKey: String = "ProductModuleNameKey"
	static let ProjectDefaultRouterTargetName: String = "ZRouter"
	// MARK: - Request
	static let NetworkReachabilityDomain: String = "github.com"
	static let RequestMaxConcurrentOperationCount: Int = 1
	static let RequestCommonHeaderParametersKey: String = "RequestCommonHeaderParametersKey"
	static let RequestCommonBodyParametersKey: String = "RequestCommonBodyParametersKey"
	static let RequestTimeoutInterval: TimeInterval = 8.0
	static let ResponseAcceptableStatusCodes: IndexSet = IndexSet(200 ..< 300)
}
