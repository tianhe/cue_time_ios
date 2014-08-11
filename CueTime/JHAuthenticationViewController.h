//
//  JHAuthenticationViewController.h
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHAuthenticationViewController : UIViewController <UITextFieldDelegate>

@property(strong, nonatomic) IBOutlet UITextField *email;
@property(strong, nonatomic) IBOutlet UITextField *password;

@end
