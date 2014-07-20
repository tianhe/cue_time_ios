//
//  JHFirstViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHInviteViewController.h"
#import "JHGameNetworkHelper.h"

@interface JHInviteViewController ()

@end

@implementation JHInviteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.maxSize.delegate = self;
    self.minSize.delegate = self;
    self.location.delegate = self;
    self.duration.delegate = self;    

    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    self.startTime.inputView = datePicker;
    self.startTime.inputAccessoryView = [[UIToolbar alloc] init];
}

- (void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)self.startTime.inputView;
    self.startTime.text = [NSString stringWithFormat:@"%@", picker.date];
}

- (IBAction)createGame:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSDate *date = [dateFormatter dateFromString:self.startTime.text];
    
    NSDictionary *gameParams = @{ @"game":
                                    @{ @"start_time": date,
                                       @"end_time": [[date dateByAddingTimeInterval:[self.duration.text intValue]*60] description],
                                       @"location": self.location.text,
                                       @"max_attendance": self.maxSize.text,
                                       @"min_attendance": self.minSize.text,
                                       @"competitiveness": [self.competitiveness titleForSegmentAtIndex:self.competitiveness.selectedSegmentIndex],
                                       @"experience_level": [self.experience titleForSegmentAtIndex:self.experience.selectedSegmentIndex] } };
    
    Promise *promise = [JHGameNetworkHelper createGameWithParams:gameParams];

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
    [self.location resignFirstResponder];
    [self.minSize resignFirstResponder];
    [self.maxSize resignFirstResponder];
    [self.duration resignFirstResponder];
    
    return YES;
}

@end
