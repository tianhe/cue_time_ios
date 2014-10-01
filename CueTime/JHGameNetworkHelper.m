//
//  JHGameNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 7/8/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHGameNetworkHelper.h"
#import "CueTime-Swift.h"
#import "JHNetworkHelper.h"

@implementation JHGameNetworkHelper

+ (PMKPromise *)createGameWithParams:(NSDictionary *)params{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper POST:gameAPIUrl parameters:params];
}

+ (PMKPromise *)deleteGameWithID:(NSString*)gameId{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/%@", [JHConstants kAPIBaseURL], gameId];
    return [JHNetworkHelper DELETE:gameAPIUrl];
}

+ (PMKPromise *)getUpcomingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/upcoming", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper GET:gameAPIUrl];
}

+ (PMKPromise *)getGoingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/going", [JHConstants kAPIBaseURL]];
    return [JHNetworkHelper GET:gameAPIUrl];
}

+ (PMKPromise *)getOrganizingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/organizing", [JHConstants kAPIBaseURL]];
     return [JHNetworkHelper GET:gameAPIUrl];
}

@end
