//
//  JHNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHNetworkHelper : NSObject

+ (PMKPromise *)POST:(NSString *)url parameters:(NSDictionary *)params;
+ (PMKPromise *)GET:(NSString *)url;
+ (PMKPromise *)PUT:(NSString *)url parameters:(NSDictionary *)params;
+ (PMKPromise *)DELETE:(NSString *)url;
@end
