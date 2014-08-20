//
//  JHNetworkHelper.h
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHNetworkHelper : NSObject

+ (Promise *)POST:(NSString *)url parameters:(NSDictionary *)params;
+ (Promise *)GET:(NSString *)url;
+ (Promise *)PUT:(NSString *)url parameters:(NSDictionary *)params;
+ (Promise *)DELETE:(NSString *)url;
@end
