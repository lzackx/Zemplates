//
//  ZRouter.swift
//
//  Created by lzackx
//

import Foundation
import ZKit


/*  Phrase of using ZRouter
	1. Register a router with API in ZRouter class extension
	2. Use intermediate class whose name has "Target_" prefix and
	   intermediate instance/class method whose name has "Action_" prefix
	   to response the Router
	3. In addition, a extension of ZMediator class can decoupling
	   the intermediate class and target class
*/

class ZRouter: NSObject {
	
	class func registerAllRouters() {
		// Assertion
//		assert(ZConstants.AppScheme.isEmpty == false, "Please setup ZConstants.AppScheme")
//		assert(ZConstants.ProductModuleName.isEmpty == false, "Please setup ZConstants.ProductModuleName")
//		assert(ZConstants.ProjectDefaultRouterTargetName.isEmpty == false, "Please setup ZConstants.ProjectDefaultRouterTargetName")
		// Registration
		ZRouterManager.registerDefaultRouters()
		// ==== Register Routers ====
//		ZRouter.registerExample()
	}
	
	// MARK: - registration APIs
	class func registrationRouterParameters(classActionCalled: Bool = false) -> [String: NSObject] {
		let swiftModuleName: String = ZKit.sharedZ().configurationValue(forKey: ZConstants.ProductModuleNameKey) as! String
		let parameters: [String: NSObject] = [
			kZMediatorParamsKeySwiftTargetModuleName: swiftModuleName as NSObject,
			kZMediatorParamsKeyClassActionCalled: NSNumber(booleanLiteral: classActionCalled),
		]
		return parameters
	}
	
	class func registerRouter(with pattern: String,
							  action: String,
							  synchronizly: Bool = true,
							  priority: ZouterCommandPriority = ZouterCommandPriority.default,
							  parameters: [String: NSObject] = [
								kZMediatorParamsKeySwiftTargetModuleName: ZKit.sharedZ().configurationValue(forKey: ZConstants.ProductModuleNameKey) as! NSObject,
								kZMediatorParamsKeyClassActionCalled: NSNumber(booleanLiteral: false),
							  ]
	) {
		let targetActionURL: String = "\(ZConstants.AppScheme)://ZRouter/\(action)"
		ZRouterManager.register(withPattern: pattern,
								targetActionURL: targetActionURL,
								synchronizly: synchronizly,
								priority: priority,
								parameters: parameters,
								willExcute: { command in
									print("willExcute: <\(command.pattern)> => <\(command.taURL)>")
								},
								didExcute: { command in
									print("didExcute: <\(command.pattern)> => <\(command.taURL)>")
								})
	}
	
}

