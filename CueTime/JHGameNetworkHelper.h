//
//  JHGameNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 7/8/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHNetworkHelper.h"

@interface JHGameNetworkHelper : JHNetworkHelper

+ (PMKPromise *)createGameWithParams:(NSDictionary *)params;
+ (PMKPromise *)deleteGameWithID:(NSString *)gameId;
+ (PMKPromise *)getUpcomingGames;
+ (PMKPromise *)getGoingGames;
+ (PMKPromise *)getOrganizingGames;

@end
