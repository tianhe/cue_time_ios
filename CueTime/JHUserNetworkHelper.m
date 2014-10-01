//
//  JHUserNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 5/18/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHUserNetworkHelper.h"
#import "JHUser.h"
#import "CueTime-Swift.h"
#import "AFNetworking+Promises.h"

@implementation JHUserNetworkHelper

+ (PMKPromise *)getUserWithId:(NSNumber *)userId{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users/%@.json", [JHConstants kAPIBaseURL], userId];
    return [JHNetworkHelper GET:userAPIUrl];
}

+ (PMKPromise *)createUserWithParams:(NSDictionary *)params{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper POST:userAPIUrl parameters:params];
}

+ (PMKPromise *)updateUserWithParams:(NSDictionary *)params withID:(NSString *)userId{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/users/%@", [JHConstants kAPIBaseURL], userId];
    return [JHNetworkHelper PUT:userAPIUrl parameters:params];
}

@end
