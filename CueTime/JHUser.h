//
//  JHUser.h
//  CueTime
//
//  Created by Tian He on 5/18/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHUser : NSObject

@property (nonatomic, copy) NSNumber *userID;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSDate   *birthdate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *drink;

@end
