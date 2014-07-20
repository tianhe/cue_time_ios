//
//  JHAppDelegate.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAppDelegate.h"
#import "JHAuthenticationViewController.h"
#import "JHSignupViewController.h"
#import "JHConstants.h"

@implementation JHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"loggedIn"]) {
        [self initiateTabBarController];
    } else {
        [self initiateSignupController];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initiateTabBarController{
    UITabBarController *tabBarController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateInitialViewController];
    self.window.rootViewController = tabBarController;
}

- (void)initiateAuthController{
    JHAuthenticationViewController *authController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"JHAuthenticationViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:authController];
    navController.navigationBarHidden = YES;
    self.window.rootViewController = navController;
}

- (void)initiateSignupController{
    JHSignupViewController *signupController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"JHSignupViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:signupController];
    navController.navigationBarHidden = YES;
    self.window.rootViewController = navController;
}
@end
