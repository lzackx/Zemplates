//
//  main.m
//
//
//  Created by lzackx
//

#import <UIKit/UIKit.h>
#import "ZAppDelegate.h"

int main(int argc, char * argv[]) {
	NSString * appDelegateClassName;
	@autoreleasepool {
	    // Setup code that might create autoreleased objects goes here.
	    appDelegateClassName = NSStringFromClass([ZAppDelegate class]);
	}
	return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
