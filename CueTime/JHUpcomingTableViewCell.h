//
//  JHUpcomingTableViewCell.h
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHGame.h"

@interface JHUpcomingTableViewCell : UITableViewCell

- (void) updateWithGame:(JHGame *)game;

@end
