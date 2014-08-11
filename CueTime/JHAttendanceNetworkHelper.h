//
//  JHAttendanceNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 8/11/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHNetworkHelper.h"

@interface JHAttendanceNetworkHelper : JHNetworkHelper

+ (Promise *)createAttendanceWithParams:(NSDictionary *)params;

@end
