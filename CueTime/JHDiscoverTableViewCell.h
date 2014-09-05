//
//  JHUpcomingTableViewCell.h
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHGame.h"

@interface JHDiscoverTableViewCell : UITableViewCell

- (void) updateWithGame:(JHGame *)game;

@property (nonatomic, strong) UIButton *button;

@end
