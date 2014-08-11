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
    self.email.delegate = self;
    self.password.delegate = self;
}

- (IBAction)login:(id)sender
{
    NSDictionary *params = @{@"user" :
                                 @{@"email": self.email.text,
                                   @"password": self.password.text}
                             };
    
    Promise *promise = [JHAuthenticationNetworkHelper authenticateUserWithParams:params];
    
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

- (IBAction)switchToSignup:(id)sender
{
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate initiateSignupController];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    
    return YES;
}

@end
