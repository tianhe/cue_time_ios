//
//  JHAuthenticationViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHSignupViewController.h"
#import "JHAppDelegate.h"

@interface JHSignupViewController ()

@end

@implementation JHSignupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signup:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loggedIn"];
    
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateTabBarController];
}

- (IBAction)switchToAuthentication:(id)sender
{
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateAuthController];
}

@end
