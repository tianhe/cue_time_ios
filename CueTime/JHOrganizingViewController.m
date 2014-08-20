//
//  JHOrganizingViewController.m
//  CueTime
//
//  Created by Tian He on 7/21/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHOrganizingViewController.h"
#import "JHOrganizingTableViewCell.h"
#import "JHGame.h"
#import "JHGameNetworkHelper.h"

@interface JHOrganizingViewController ()

@end

@implementation JHOrganizingViewController

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
    NSMutableArray *organizingGames = [[NSMutableArray alloc] init];
    [JHGameNetworkHelper getOrganizingGames].then(^(NSArray *json){
        for (NSDictionary *gameArray in json){
            NSError* error = nil;
            JHGame *game = [[JHGame alloc] initWithDictionary:gameArray error:&error];
            if(game)
                [organizingGames addObject:game];
        }
        self.games = organizingGames;
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
    JHOrganizingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"organizingTableViewCell"];
    if (cell == nil) {
        cell = [[JHOrganizingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"organizingTableViewCell"];
    }
    JHGame *game = (JHGame *)[self.games objectAtIndex:indexPath.row];
    [cell updateWithGame:game];
    
    [cell.button addTarget:self action:@selector(cancelGameWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (void)cancelGameWasTapped:(UIButton*)sender
{
    NSString *gameId = [NSString stringWithFormat:@"%d", sender.tag];
    
    [JHGameNetworkHelper deleteGameWithID:gameId].then(^(NSArray *json){
        [self.tableView reloadData];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}

@end
