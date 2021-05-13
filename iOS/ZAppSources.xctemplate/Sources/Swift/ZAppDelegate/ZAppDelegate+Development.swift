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
		DoraemonManager.shareInstance().install();
	}
	
}
#endif

