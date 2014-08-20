//
//  JHAttendance.h
//  CueTime
//
//  Created by Tian He on 8/14/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JSONModel.h"

@protocol JHGame
@end

@interface JHAttendance : JSONModel

@property (assign, nonatomic) int id;
@property NSNumber *gameId;
@property NSNumber *userId;
@property NSString *status;

@end
