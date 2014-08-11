//
//  JHAttendanceNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 8/11/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAttendanceNetworkHelper.h"
#import "JHConstants.h"

@implementation JHAttendanceNetworkHelper

+ (Promise *)createAttendanceWithParams:(NSDictionary *)params{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances", kAPIBaseURL];
    return [JHNetworkHelper post:attendanceAPIUrl parameters:params];
}

@end
