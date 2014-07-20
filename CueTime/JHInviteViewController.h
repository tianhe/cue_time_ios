//
//  JHFirstViewController.h
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHInviteViewController : UIViewController  <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *minSize;
@property (weak, nonatomic) IBOutlet UITextField *maxSize;
@property (weak, nonatomic) IBOutlet UITextField *startTime;
@property (weak, nonatomic) IBOutlet UITextField *duration;
@property (weak, nonatomic) IBOutlet UISegmentedControl *competitiveness;
@property (weak, nonatomic) IBOutlet UISegmentedControl *experience;
@property (weak, nonatomic) IBOutlet UITextField *location;


@end
