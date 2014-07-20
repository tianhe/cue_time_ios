//
//  JHGame.h
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHGame : NSObject

@property NSString *title;
@property NSString *activityId;
@property NSString *status;
@property NSString *competitiveness;
@property NSString *drinksRequirement;
@property NSDate *startTime;
@property NSDate *endTime;
@property NSString *experienceLevel;
@property NSString *genderRequirement;
@property NSInteger *locationId;
@property NSInteger *maxAge;
@property NSInteger *minAge;
@property NSInteger *attendance;
@property NSInteger *organizerId;

@end
