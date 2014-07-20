//
//  JHUpcomingView.m
//  CueTime
//
//  Created by Tian He on 7/17/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHUpcomingView.h"

@implementation JHUpcomingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *activity = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 200, 20)];
        activity.text = @"B";
        [activity setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:activity];

        UILabel *attendees = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 20)];
        attendees.text = @"5";
        attendees.font = [UIFont systemFontOfSize:14];
        [self addSubview:attendees];
        

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 200, 20)];
        title.text = @"Game On!";
        title.font = [UIFont systemFontOfSize:14];
        [self addSubview:title];
        
        UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 200, 20)];
        time.text = @"Sat 7/20 5:00pm-7:00pm";
        time.font = [UIFont systemFontOfSize:14];
        [self addSubview:time];
        
        UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 250, 20)];
        location.text = @"Columbus Playground: 45th Between 8th and 9th";
        location.font = [UIFont systemFontOfSize:14];
        [self addSubview:location];

        UILabel *experienceLevel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 200, 20)];
        experienceLevel.text = @"Beg";
        experienceLevel.font = [UIFont systemFontOfSize:14];
        [self addSubview:experienceLevel];

        UILabel *competitiveness = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 20)];
        competitiveness.text = @"JV";
        competitiveness.font = [UIFont systemFontOfSize:14];
        [self addSubview:competitiveness];

    }
    return self;
}

@end
