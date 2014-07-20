//
//  JHGameNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 7/8/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHGameNetworkHelper.h"
#import "JHConstants.h"
#import "JHNetworkHelper.h"

@implementation JHGameNetworkHelper

+ (Promise *)createGameWithParams:(NSDictionary *)params{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games", kAPIBaseURL];
    return [JHNetworkHelper post:gameAPIUrl parameters:params];
}

+ (Promise *)getUpcomingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/upcoming", kAPIBaseURL];
    return [JHNetworkHelper get:gameAPIUrl];
}

+ (Promise *)getGoingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/going", kAPIBaseURL];
    return [JHNetworkHelper get:gameAPIUrl];
}

+ (Promise *)getOrganizingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/organizing", kAPIBaseURL];
     return [JHNetworkHelper get:gameAPIUrl];
}

@end
