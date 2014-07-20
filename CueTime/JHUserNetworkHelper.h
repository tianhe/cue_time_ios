//
//  JHUserNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 5/18/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHNetworkHelper.h"

@interface JHUserNetworkHelper : JHNetworkHelper

+ (Promise *)getUserWithId:(NSNumber *)userId;
+ (Promise *)createUserWithParams:(NSDictionary *)params;
+ (Promise *)updateUserWithParams:(NSDictionary *)params withID:(NSString *)userId;
@end
