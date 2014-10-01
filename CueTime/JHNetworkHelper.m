//
//  JHNetworkHelper.m
//  CueTime
//
//  Created by Tian He on 7/20/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHNetworkHelper.h"
#import "CueTime-Swift.h"
#import "AFNetworking+Promises.h"

@implementation JHNetworkHelper

+ (PMKPromise *)POST:(NSString *)url parameters:(NSDictionary *)params
{
    NSMutableDictionary *authenticatedParams = [[NSMutableDictionary alloc] initWithDictionary:params];
    
    NSString *authenticationToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"authentication_token"];
    [authenticatedParams setValue:authenticationToken forKey:@"authentication_token"];

    NSString *email = [[NSUserDefaults standardUserDefaults] objectForKey:@"email" ];
    [authenticatedParams setValue:email forKey:@"email"];

    return [NSURLConnection POST:url formURLEncodedParameters:authenticatedParams];
}

+ (PMKPromise *)GET:(NSString *)url
{
    NSString *authenticationToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"authentication_token"];
    NSString *email = [[NSUserDefaults standardUserDefaults] objectForKey:@"email" ];
    
    NSString *getUrl = [NSString stringWithFormat:@"%@?email=%@&authentication_token=%@", url, email, authenticationToken];
    return [NSURLConnection GET:getUrl];
}

+ (PMKPromise *)PUT:(NSString *)url parameters:(NSDictionary *)params
{
    NSMutableDictionary *authenticatedParams = [[NSMutableDictionary alloc] initWithDictionary:params];
    
    NSString *authenticationToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"authentication_token"];
    [authenticatedParams setValue:authenticationToken forKey:@"authentication_token"];
    [authenticatedParams setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"email" ] forKey:@"email"];

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    return [manager PUT:url parameters:authenticatedParams];
    
}

+ (PMKPromise *)DELETE:(NSString *)url
{
    NSMutableDictionary *authenticatedParams = [[NSMutableDictionary alloc] init];

    NSString *authenticationToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"authentication_token"];
    [authenticatedParams setValue:authenticationToken forKey:@"authentication_token"];
    [authenticatedParams setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"email" ] forKey:@"email"];

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    return [manager DELETE:url parameters:authenticatedParams];
}

@end
