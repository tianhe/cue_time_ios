//
//  JHNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHNetworkHelper : NSObject

+ (Promise *)post:(NSString *)url parameters:(NSDictionary *)params;
+ (Promise *)get:(NSString *)url;
+ (Promise *)put:(NSString *)url parameters:(NSDictionary *)params;

@end
