//
//  JHGoingViewController.m
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHGoingViewController.h"
#import "JHGoingTableViewCell.h"
#import "JHGame.h"
#import "JHGameNetworkHelper.h"
#import "JHAttendanceNetworkHelper.h"
#import "JHAttendance.h"

@interface JHGoingViewController ()

@end

@implementation JHGoingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 100;
    self.tableView.frame = bounds;    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self loadGames];
}

- (void)loadGames
{
    [JHAttendanceNetworkHelper getAttendances].then(^(NSArray *json){
        NSMutableArray *games = [[NSMutableArray alloc] init];
        
        for (NSDictionary *attendanceAttributes in json){
            NSError* error = nil;
            JHGame *game = [[JHGame alloc] initWithDictionary:attendanceAttributes[@"game"] error:&error];
            if(game)
                [games addObject:game];
        }
        self.games = games;

        [self.tableView reloadData];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.games.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHGoingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goingTableViewCell"];
    if (cell == nil) {
        cell = [[JHGoingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"goingTableViewCell"];
    }
    JHGame *game = (JHGame *)[self.games objectAtIndex:indexPath.row];
    JHAttendance *attendance = [self attendanceFromGame:game];
    
    [cell updateWithGame:game andAttendance:attendance];
    
    [cell.button addTarget:self action:@selector(didTapCancelAttendance:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)didTapCancelAttendance:(UIButton *)sender
{
    NSString *attendanceId = [NSString stringWithFormat:@"%d", sender.tag];
        
    [JHAttendanceNetworkHelper deleteAttendanceWithID:attendanceId].then(^(NSArray *json){
        [self.tableView reloadData];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

- (JHAttendance *)attendanceFromGame:(JHGame *) game{
    NSNumber *userId = [[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"];
    NSPredicate *attendancePredicate = [NSPredicate predicateWithFormat:@"userId == %d", [userId intValue]];
    NSArray *attendances = [game.attendances filteredArrayUsingPredicate:attendancePredicate];
    return [attendances firstObject];
}

@end
