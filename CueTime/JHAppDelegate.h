//
//  JHAppDelegate.h
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHAuthenticationViewController.h"

@interface JHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) JHAuthenticationViewController *authController;
@property (nonatomic, strong) UITabBarController *tabBarController;

- (void)initiateTabBarController;
- (void)initiateAuthController;
- (void)logout;


@end
