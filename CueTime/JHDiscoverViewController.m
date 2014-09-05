//
//  JHUpcomingViewController.m
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHDiscoverViewController.h"
#import "JHDiscoverTableViewCell.h"
#import "JHGame.h"
#import "JHGameNetworkHelper.h"
#import "JHAttendanceNetworkHelper.h"
#import "JHDiscoverTableView.h"

@interface JHDiscoverViewController ()

@property(nonatomic, strong) JHDiscoverTableView* tableView;

@end

@implementation JHDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 40;
    bounds.size.height = bounds.size.height - 40;
    self.tableView = [[JHDiscoverTableView alloc] initWithFrame:bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self loadGames];
}

- (void)loadGames
{
    NSMutableArray *games = [[NSMutableArray alloc] init];
    [JHGameNetworkHelper getUpcomingGames].then(^(NSArray *json){
        for (NSDictionary *gameArray in json){
            NSError* error = nil;
            JHGame *game = [[JHGame alloc] initWithDictionary:gameArray error:&error];
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

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"upcomingTableViewCell"];
    if (cell == nil) {
        cell = [[JHDiscoverTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"upcomingTableViewCell"];
    }
    JHGame *game = (JHGame *)[self.games objectAtIndex:indexPath.row];
    [cell updateWithGame:game];
    
    [cell.button addTarget:self action:@selector(acceptGameButtonWasTapped:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (void) acceptGameButtonWasTapped:(UIButton *)sender
{

    NSDictionary *params = @{@"game_id": [NSString stringWithFormat:@"%ld", sender.tag],
                             @"user_id": [[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"]
                            };
    
    [JHAttendanceNetworkHelper createAttendanceWithParams:params].then(^(NSArray *json){
        [self.tableView reloadData];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });    
}

@end
