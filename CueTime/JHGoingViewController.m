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
    NSMutableArray *games = [[NSMutableArray alloc] init];
    [JHGameNetworkHelper getGoingGames].then(^(NSArray *json){
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
    JHGoingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"goingTableViewCell"];
    if (cell == nil) {
        cell = [[JHGoingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"goingTableViewCell"];
    }
    JHGame *game = (JHGame *)[self.games objectAtIndex:indexPath.row];
    [cell updateWithGame:game];
    return cell;
}


@end
