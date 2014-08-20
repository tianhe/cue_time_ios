//
//  JHAttendanceNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 8/11/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHNetworkHelper.h"

@interface JHAttendanceNetworkHelper : JHNetworkHelper

+ (Promise *)getAttendances;
+ (Promise *)createAttendanceWithParams:(NSDictionary *)params;
+ (Promise *)deleteAttendanceWithID:(NSString *)attendanceId;
+ (Promise *)updateAttendanceWithParams:(NSDictionary *)params withID:(NSString *)attendanceID;
@end
