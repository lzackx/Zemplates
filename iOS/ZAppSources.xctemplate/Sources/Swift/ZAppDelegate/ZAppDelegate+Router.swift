//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit
import ZKit


extension ZAppDelegate {
	
	func setupRouter() {
		ZRouterManager.initialize(withScheme: ZConstants.AppScheme)
		ZRouter.registerAllRouters()
	}
	
}

