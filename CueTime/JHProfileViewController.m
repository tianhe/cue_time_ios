//
//  JHProfileViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHProfileViewController.h"
#import "JHAppDelegate.h"

@interface JHProfileViewController ()

@end

@implementation JHProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)logout:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"loggedIn"];
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateAuthController];
}

@end
