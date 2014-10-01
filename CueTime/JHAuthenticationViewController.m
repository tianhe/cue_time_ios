//
//  JHAuthenticationViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAuthenticationViewController.h"
#import "JHAuthenticationNetworkHelper.h"
#import "JHAppDelegate.h"

@interface JHAuthenticationViewController ()

@end

@implementation JHAuthenticationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
    CGRect frame = loginView.frame;
    frame.origin = CGPointMake( ([UIScreen mainScreen].bounds.size.width - frame.size.width)/2, [UIScreen mainScreen].bounds.size.height/2);
    loginView.frame = frame;

    [self.view addSubview:loginView];
    loginView.delegate = self;
}

- (void)authenticateOnServerSide:(NSString*)accessToken
{
    PMKPromise *promise = [JHAuthenticationNetworkHelper authenticateUserWithParams:@{@"user": @{@"fb_access_token":accessToken}}];
    
    promise.then(^(NSDictionary *json){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loggedIn"];
        [[NSUserDefaults standardUserDefaults] setValue:json[@"user"][@"authentication_token"] forKey:@"authentication_token"];
        [[NSUserDefaults standardUserDefaults] setValue:json[@"user"][@"id"] forKey:@"user_id"];
        [[NSUserDefaults standardUserDefaults] setValue:json[@"user"][@"email"] forKey:@"email"];
        [[NSUserDefaults standardUserDefaults] synchronize];

        JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate initiateTabBarController];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
}

// Logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    NSString *accessToken = [FBSession activeSession].accessTokenData.accessToken;
    [self authenticateOnServerSide:accessToken];
}

// Logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate logout];
}

@end
