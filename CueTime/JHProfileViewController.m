//
//  JHProfileViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHProfileViewController.h"
#import "JHUserNetworkHelper.h"
#import "JHAppDelegate.h"

@interface JHProfileViewController ()

@end

@implementation JHProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name.delegate = self;

}

- (IBAction)update:(id)sender
{
    NSDictionary *userParams = @{ @"user" : @{ @"birthdate": self.birthdate.date,
       @"drinking_habit": [self.drinkingHabit titleForSegmentAtIndex:self.drinkingHabit.selectedSegmentIndex],
       @"name": self.name.text,
       @"gender": [self.gender titleForSegmentAtIndex:self.gender.selectedSegmentIndex]} };
    
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
    Promise *promise = [JHUserNetworkHelper updateUserWithParams:userParams withID:userID];
    
    promise.then(^(NSDictionary *json){
        NSLog(@"Update Successful");
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

- (IBAction)logout:(id)sender
{
    JHAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate logout];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.name resignFirstResponder];
    return YES;
}

@end
