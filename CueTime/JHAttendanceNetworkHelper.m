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

+ (Promise *)getAttendances{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances", kAPIBaseURL];
    return [JHNetworkHelper GET:attendanceAPIUrl];
}

+ (Promise *)createAttendanceWithParams:(NSDictionary *)params{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances", kAPIBaseURL];
    return [JHNetworkHelper POST:attendanceAPIUrl parameters:params];
}

+ (Promise *)deleteAttendanceWithID:(NSString *)attendanceId{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances/%@", kAPIBaseURL, attendanceId];
    return [JHNetworkHelper DELETE:attendanceAPIUrl];
}

+ (Promise *)updateAttendanceWithParams:(NSDictionary *)params withID:(NSString *)attendanceID{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances/%@", kAPIBaseURL, attendanceID];
    return [JHNetworkHelper PUT:attendanceAPIUrl parameters:params];
}

@end
