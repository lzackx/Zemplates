//
//  ZViewController.swift
//
//  Created by lzackx
//

import UIKit
import ZKit


class ZViewController: UIViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		ZRouterManager.performURLString("\(ZConstants.AppScheme)://example")
		ZRequest.post(url: "https://m.github.com")
	}
	
}
