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
    return [JHNetworkHelper POST:gameAPIUrl parameters:params];
}

+ (Promise *)deleteGameWithID:(NSString*)gameId{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/%@", kAPIBaseURL, gameId];
    return [JHNetworkHelper DELETE:gameAPIUrl];
}

+ (Promise *)getUpcomingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/upcoming", kAPIBaseURL];
    return [JHNetworkHelper GET:gameAPIUrl];
}

+ (Promise *)getGoingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/going", kAPIBaseURL];
    return [JHNetworkHelper GET:gameAPIUrl];
}

+ (Promise *)getOrganizingGames{
    NSString *gameAPIUrl = [NSString stringWithFormat:@"http://%@/v1/games/organizing", kAPIBaseURL];
     return [JHNetworkHelper GET:gameAPIUrl];
}

@end
