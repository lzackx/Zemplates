//
//  ZRequest.swift
//
//  Created by lzackx
//

import Foundation
import ZKit


class ZRequest: NSObject {
	
	class func launchCommonRequest() {
		// Assertion
		assert(ZConstants.NetworkReachabilityDomain.isEmpty == false, "Please setup ZConstants.NetworkReachabilityDomain")
		assert(ZConstants.RequestMaxConcurrentOperationCount > 0, "Please setup ZConstants.RequestMaxConcurrentOperationCount")
		assert(ZConstants.RequestCommonHeaderParametersKey.isEmpty == false, "Please setup ZConstants.RequestCommonHeaderParametersKey")
		assert(ZConstants.RequestCommonBodyParametersKey.isEmpty == false, "Please setup ZConstants.RequestCommonBodyParametersKey")
		assert(ZConstants.RequestTimeoutInterval > 0, "Please setup ZConstants.RequestTimeoutInterval")
		// Launch
		ZRequestManager.launchNetworkReachabilityMonitor(withDomain: ZConstants.NetworkReachabilityDomain) { status in
			switch (status) {
				case 0:
					print("[ZRequestManager]: Network Reachability Not Reachable")
				case 1:
					print("[ZRequestManager]: Network Reachability Reachable Via WWAN")
				case 2:
					print("[ZRequestManager]: Network Reachability Reachable Via WiFi")
				case -1:
					fallthrough
				default:
					print("[ZRequestManager]: Network Reachability Unknown")
					break
			}
		}
		
		ZRequestManager.launchRequest(withRequestMaxConcurrentOperationCount: ZConstants.RequestMaxConcurrentOperationCount,
									  commonHeaderParameters: ZKit.sharedZ().configurationValue(forKey: ZConstants.RequestCommonHeaderParametersKey) as? [AnyHashable : Any],
									  commonBodyParameters: ZKit.sharedZ().configurationValue(forKey: ZConstants.RequestCommonBodyParametersKey) as? [AnyHashable : Any],
									  requestTimeoutInterval: ZConstants.RequestTimeoutInterval,
									  responseAcceptableStatusCodes: ZConstants.ResponseAcceptableStatusCodes,
									  commonRequestTaskDidFinishCollectingMetricsBlock: { session, task, metrics in
										debugPrint("[ZRequest]: \(task.originalRequest!.url!.absoluteString) duration=\(metrics.taskInterval.duration) ")
									  },
									  commonRequestTaskDidComplete: { session, task, error in
										if (error != nil) { // client error
											debugPrint("[ZRequest]: \(task.originalRequest!.url!.absoluteString) error:\(error.debugDescription)")
										}
									  }
		)
	}
	
	// MARK: - Request
	fileprivate class func matchedDevelopURL(url: String) -> String? {
		for urlPattern in ZRequestURL.DevelopURLs.keys {
			let predicate: NSPredicate = NSPredicate.init(format: "SELF MATCHES %@", urlPattern)
			if (predicate.evaluate(with: url)) {
				let developURL = ZRequestURL.DevelopURLs[urlPattern]!
				debugPrint("[ZRequest]: <\(url)> == <\(urlPattern)> => <\(developURL)>")
				return developURL
			}
		}
		return nil
	}
	
	class func get(url: String,
				   header: [String: Any] = [String: Any](),
				   parameters: [String: Any] = [String: Any](),
				   shouldCache: Bool = false,
				   dataClass: AnyClass? = nil,
				   success: @escaping ((URLSessionTask, Any?) -> Void) = { task, object in
					debugPrint("[ZRequest]: success \(String(describing: task.originalRequest?.url?.absoluteString))")
				   },
				   failure: @escaping ((URLSessionDataTask?, Error) -> Void) = { task, error in
					debugPrint("[ZRequest]: failure \(String(describing: task?.originalRequest?.url?.absoluteString))")
				   }) {
		var targetURL: String = url
		if (ZEnvironment.currentEnvironment() == ZConstants.ApplicationEnvironmentDevelop) {
			if let matchedRequestURL = ZRequest.matchedDevelopURL(url: targetURL) {
				targetURL = matchedRequestURL
			}
		}
		ZRequestManager.get(targetURL,
							header: header,
							parameters: parameters,
							shouldCache: shouldCache,
							dataClass: dataClass,
							success: success,
							failure: failure)
	}
	
	class func post(url: String,
					header: [String: Any] = [String: Any](),
					parameters: [String: Any] = [String: Any](),
					shouldCache: Bool = false,
					dataClass: AnyClass? = nil,
					success: @escaping ((URLSessionTask, Any?) -> Void) = { task, object in
						debugPrint("[ZRequest]: success \(String(describing: task.originalRequest?.url?.absoluteString))")
					},
					failure: @escaping ((URLSessionDataTask?, Error) -> Void) = { task, error in
						debugPrint("[ZRequest]: failure \(String(describing: task?.originalRequest?.url?.absoluteString))")
					}) {
		var targetURL: String = url
		if (ZEnvironment.currentEnvironment() == ZConstants.ApplicationEnvironmentDevelop) {
			if let matchedRequestURL = ZRequest.matchedDevelopURL(url: targetURL) {
				targetURL = matchedRequestURL
			}
		}
		ZRequestManager.post(targetURL,
							 header: header,
							 parameters: parameters,
							 shouldCache: shouldCache,
							 dataClass: dataClass,
							 success: success,
							 failure: failure)
	}
	
}

