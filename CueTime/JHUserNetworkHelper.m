//
//  JHUserNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 5/18/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHUserNetworkHelper.h"
#import "JHUser.h"
#import "JHConstants.h"
#import "AFNetworking+Promises.h"

@implementation JHUserNetworkHelper

+ (Promise *)getUserWithId:(NSNumber *)userId{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users/%@.json", kAPIBaseURL, userId];
    return [JHNetworkHelper GET:userAPIUrl];
}

+ (Promise *)createUserWithParams:(NSDictionary *)params{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users", kAPIBaseURL];
    return [JHNetworkHelper POST:userAPIUrl parameters:params];
}

+ (Promise *)updateUserWithParams:(NSDictionary *)params withID:(NSString *)userId{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users/%@", kAPIBaseURL, userId];
    return [JHNetworkHelper PUT:userAPIUrl parameters:params];
}

@end
