//
//  XGAppDelegate.h
//  ReactiveCocoaExamples
//
//  Created by Xiaonuo Gantan on 2013-05-08.
//  Copyright (c) 2013 Xiaonuo Gantan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XGViewController;

@interface XGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) XGViewController *viewController;

@end
