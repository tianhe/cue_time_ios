//
//  JHUpcomingTableViewCell.m
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHUpcomingTableViewCell.h"

@implementation JHUpcomingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateWithGame:(JHGame *)game
{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 90)];
    
    UILabel *activity = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 200, 20)];
    activity.text = game.activityName;
    [activity setFont:[UIFont systemFontOfSize:14]];
    [contentView addSubview:activity];
    
    UILabel *size = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 20)];
    size.text = [game.size stringValue];
    size.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:size];
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 200, 20)];
    title.text = game.title;
    title.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:title];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 200, 20)];
    NSDateFormatter *startDateFormatter = [[NSDateFormatter alloc] init];
    [startDateFormatter setDateFormat:@"EEE, MMM d, h:mm a"];
    NSString *startTimeString = [startDateFormatter stringFromDate:game.startTime];
    
    NSDateFormatter *endDateFormatter = [[NSDateFormatter alloc] init];
    [endDateFormatter setDateFormat:@"h:mm a"];
    NSString *endTimeString = [endDateFormatter stringFromDate:game.endTime];
    
    time.text = [NSString stringWithFormat:@"%@-%@", startTimeString, endTimeString];
    time.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:time];
    
    UILabel *neighborhood = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 250, 20)];
    neighborhood.text = game.neighborhood;
    neighborhood.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:neighborhood];
    
    UILabel *experienceLevel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 200, 20)];
    experienceLevel.text = game.experienceLevel;
    experienceLevel.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:experienceLevel];
    
    UILabel *competitiveness = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 20)];
    competitiveness.text = game.competitiveness;
    competitiveness.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:competitiveness];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(100, 60, 20, 20)];
    [self.button setTitle:@"Y" forState:UIControlStateNormal];
    self.button.tag = game.id;
    [contentView addSubview:self.button];
    
    [self.contentView addSubview:contentView];
}

@end
