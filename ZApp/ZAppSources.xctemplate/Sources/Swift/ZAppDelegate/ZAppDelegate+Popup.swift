//
//  ZAppDelegate.swift
//
//  Created by lzackx
//

import UIKit
import ZKit

extension ZAppDelegate {
	
	func setupPopup() {
		ZPopupManager.registerPopupObjects(self.popupObjects())
	}
	
	// MARK: - File Private Methods
	fileprivate func popupObjects() -> [NSObject] {
		let popupObjects: [NSObject] = [NSObject]();
		
		return popupObjects
	}
}

