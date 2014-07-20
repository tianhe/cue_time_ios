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

    }
    return self;
}

- (void) updateWithGames:(NSArray *)games
{
    JHGame *game = [games objectAtIndex:0];

    UILabel *activity = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 200, 20)];
    activity.text = game.activityName;
    [activity setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:activity];
    
    UILabel *size = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 20)];
    size.text = [game.size stringValue];
    size.font = [UIFont systemFontOfSize:14];
    [self addSubview:size];
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 200, 20)];
    title.text = game.title;
    title.font = [UIFont systemFontOfSize:14];
    [self addSubview:title];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 200, 20)];
    NSDateFormatter *startDateFormatter = [[NSDateFormatter alloc] init];
    [startDateFormatter setDateFormat:@"EEE, MMM d, h:mm a"];
    NSString *startTimeString = [startDateFormatter stringFromDate:game.startTime];
    
    NSDateFormatter *endDateFormatter = [[NSDateFormatter alloc] init];
    [endDateFormatter setDateFormat:@"h:mm a"];
    NSString *endTimeString = [endDateFormatter stringFromDate:game.endTime];
    
    time.text = [NSString stringWithFormat:@"%@-%@", startTimeString, endTimeString];
    time.font = [UIFont systemFontOfSize:14];
    [self addSubview:time];
    
    UILabel *neighborhood = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 250, 20)];
    neighborhood.text = game.neighborhood;
    neighborhood.font = [UIFont systemFontOfSize:14];
    [self addSubview:neighborhood];
    
    UILabel *experienceLevel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 200, 20)];
    experienceLevel.text = game.experienceLevel;
    experienceLevel.font = [UIFont systemFontOfSize:14];
    [self addSubview:experienceLevel];
    
    UILabel *competitiveness = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 20)];
    competitiveness.text = game.competitiveness;
    competitiveness.font = [UIFont systemFontOfSize:14];
    [self addSubview:competitiveness];
}

@end
