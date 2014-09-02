//
//  JHGame.h
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "JHAttendance.h"

@protocol JHAttendance
@end

@interface JHGame : JSONModel

@property (assign, nonatomic) int id;
@property NSString<Optional> *title;
@property NSNumber *size;
@property NSString *experienceLevel;
@property NSNumber<Optional> *maxAge;
@property NSNumber<Optional> *minAge;
@property NSString<Optional> *genderRequirement;
@property NSString<Optional> *drinksRequirement;
@property NSString<Optional> *competitiveness;
@property NSString *status;
@property NSString<Optional> *neighborhood;
@property NSString<Optional> *organizerName;
@property NSString *activityName;
@property NSDate *startTime;
@property NSDate *endTime;
@property (strong, nonatomic) NSArray<JHAttendance>* attendances;

@end
