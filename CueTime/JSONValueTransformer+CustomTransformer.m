//
//  JSONValueTransformer+CustomTransformer.m
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JSONValueTransformer+CustomTransformer.h"
#import "CueTime-Swift.h"

@implementation JSONValueTransformer (CustomTransformer)

- (NSDate *)NSDateFromNSString:(NSString*)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];    
    [formatter setDateFormat:[JHConstants kAPIDateFormat]];
    return [formatter dateFromString:string];
}

- (NSString *)JSONObjectFromNSDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[JHConstants kAPIDateFormat]];
    return [formatter stringFromDate:date];
}

@end
