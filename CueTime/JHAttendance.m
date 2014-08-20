//
//  JHAttendance.m
//  CueTime
//
//  Created by Tian He on 8/14/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAttendance.h"

@implementation JHAttendance

+(JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

@end
