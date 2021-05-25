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
		self.view.backgroundColor = UIColor.white
		
//		ZRouterManager.performURLString("\(ZConstants.AppScheme)://example")
		ZRequest.post(url: "https://m.github.com")
	}
	
}
