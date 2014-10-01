//
//  JHAuthenticationNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 5/18/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHAuthenticationNetworkHelper.h"
#import "CueTime-Swift.h"
#import "JHUser.h"
#import "AFNetworking+Promises.h"

@implementation JHAuthenticationNetworkHelper

+ (PMKPromise *)authenticateUserWithParams:(NSDictionary *)params{
    NSString *userAPIUrl = [NSString stringWithFormat:@"http://%@/v1/authentications", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper POST:userAPIUrl parameters:params];
}

@end
