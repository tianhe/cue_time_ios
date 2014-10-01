//
//  JHFirstViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHOrganizeViewController.h"
#import "JHGameNetworkHelper.h"
#import "CueTime-Swift.h"

@interface JHOrganizeViewController ()

@end

@implementation JHOrganizeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.titleField.delegate = self;
    self.activity.delegate = self;
    self.size.delegate = self;

    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    self.startTime.inputView = datePicker;
    self.startTime.inputAccessoryView = [[UIToolbar alloc] init];

    self.duration.delegate = self;
    self.location.delegate = self;
}

- (void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)self.startTime.inputView;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:[JHConstants kDisplayDateFormat]];

    self.startTime.text = [dateFormatter stringFromDate:picker.date];
}

- (IBAction)createGame:(id)sender {
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:kAPIDateFormat];
    //NSDate *date = [dateFormatter dateFromString:self.startTime.text];
    UIDatePicker *picker = (UIDatePicker*)self.startTime.inputView;
    NSDate *date = picker.date;
    
    NSDictionary *gameParams = @{ @"game":
                                    @{
                                       @"title": self.titleField.text,
                                       @"activity": self.activity.text,
                                       @"size": self.size.text,
                                       @"start_time": date,
                                       @"end_time": [[date dateByAddingTimeInterval:[self.duration.text intValue]*60] description],
                                       @"experience_level": [self.experience titleForSegmentAtIndex:self.experience.selectedSegmentIndex],
                                       @"location": self.location.text
                                       } };
    
    PMKPromise *promise = [JHGameNetworkHelper createGameWithParams:gameParams];

    promise.then(^(NSDictionary *json){
        NSLog(@"Update Successful");
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.titleField resignFirstResponder];
    [self.activity resignFirstResponder];
    [self.size resignFirstResponder];
    [self.duration resignFirstResponder];
    [self.location resignFirstResponder];
    
    return YES;
}

@end
