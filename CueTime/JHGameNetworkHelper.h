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

+ (Promise *)createGameWithParams:(NSDictionary *)params;
+ (Promise *)deleteGameWithID:(NSString *)gameId;
+ (Promise *)getUpcomingGames;
+ (Promise *)getGoingGames;
+ (Promise *)getOrganizingGames;

@end
