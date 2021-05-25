//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit

#if DEBUG
import DoraemonKit


extension ZAppDelegate {
	
	func setupDoraemonKit() {
		DoraemonManager.shareInstance().install()
		DoraemonManager.shareInstance().addPlugin(withTitle: "Release", icon: "doraemon_setting", desc: "Release Environment", pluginName: "", atModule: "ZApp Environment") { data in
			ZEnvironment.updateEnvironment(environment: ZConstants.ApplicationEnvironmentRelease)
			DispatchQueue.main.async {
				(UIApplication.shared.delegate as! ZAppDelegate).resetWindow()
				DoraemonManager.shareInstance().hiddenHomeWindow()
			}
		}
		DoraemonManager.shareInstance().addPlugin(withTitle: "Develop", icon: "doraemon_setting", desc: "Develop Environment", pluginName: "", atModule: "ZApp Environment") { data in
			ZEnvironment.updateEnvironment(environment: ZConstants.ApplicationEnvironmentDevelop)
			DispatchQueue.main.async {
				(UIApplication.shared.delegate as! ZAppDelegate).resetWindow()
				DoraemonManager.shareInstance().hiddenHomeWindow()
			}
		}
	}
	
}
#endif

