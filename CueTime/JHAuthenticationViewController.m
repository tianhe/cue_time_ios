//
//  JHAuthenticationViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAuthenticationViewController.h"
#import "JHAppDelegate.h"

@interface JHAuthenticationViewController ()

@end

@implementation JHAuthenticationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)login:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loggedIn"];
    
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateTabBarController];
}

- (IBAction)switchToSignup:(id)sender
{
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateSignupController];
}

@end
