//
//  JHAttendanceNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 8/11/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHNetworkHelper.h"

@interface JHAttendanceNetworkHelper : JHNetworkHelper

+ (PMKPromise *)getAttendances;
+ (PMKPromise *)createAttendanceWithParams:(NSDictionary *)params;
+ (PMKPromise *)deleteAttendanceWithID:(NSString *)attendanceId;
+ (PMKPromise *)updateAttendanceWithParams:(NSDictionary *)params withID:(NSString *)attendanceID;
@end
