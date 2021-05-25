//
//  ZRequestURL.swift
//  ztt
//
//  Created by lzackx on 2021/5/25.
//

import Foundation


struct ZRequestURL {
	// MARK: - [ ReleaseURL: DevelopURL], support Regular Expression
	static let DevelopURLs: [String: String] = [
		"^http[s]?://.*github.com": "https://m.lzackx.com"
	]
}
