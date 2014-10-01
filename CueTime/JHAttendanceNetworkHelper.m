//
//  JHAttendanceNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 8/11/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAttendanceNetworkHelper.h"
#import "CueTime-Swift.h"

@implementation JHAttendanceNetworkHelper

+ (PMKPromise *)getAttendances{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper GET:attendanceAPIUrl];
}

+ (PMKPromise *)createAttendanceWithParams:(NSDictionary *)params{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper POST:attendanceAPIUrl parameters:params];
}

+ (PMKPromise *)deleteAttendanceWithID:(NSString *)attendanceId{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances/%@", [JHConstants kAPIBaseURL], attendanceId];
    return [JHNetworkHelper DELETE:attendanceAPIUrl];
}

+ (PMKPromise *)updateAttendanceWithParams:(NSDictionary *)params withID:(NSString *)attendanceID{
    NSString *attendanceAPIUrl = [NSString stringWithFormat:@"http://%@/v1/attendances/%@", [JHConstants kAPIBaseURL], attendanceID];
    return [JHNetworkHelper PUT:attendanceAPIUrl parameters:params];
}

@end
