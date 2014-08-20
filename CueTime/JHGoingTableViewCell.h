//
//  JHGoingTableViewCell.h
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHGame.h"
#import "JHAttendance.h"

@interface JHGoingTableViewCell : UITableViewCell

- (void) updateWithGame:(JHGame *)game andAttendance:(JHAttendance *)attendance;
@property UIButton *button;

@end
