//
//  JHSecondViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHChallengeViewController.h"
#import "JHUpcomingView.h"
#import "JHGameNetworkHelper.h"
#import "JHGame.h"

@interface JHChallengeViewController ()

@property(strong, atomic) JHUpcomingView* upcomingView;
@property(strong, atomic) UIView* goingView;
@property(strong, atomic) UIView* organizingView;

@property(strong, atomic) NSArray* upcomingGames;
@property(strong, atomic) NSArray* goingGames;
@property(strong, atomic) NSArray* organizingGames;

@end

@implementation JHChallengeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect bounds = self.view.bounds;
    bounds.origin.y = 100;
    
//    [JHGameNetworkHelper getGoingGames].then(^(NSDictionary *json){
//        NSLog(@"Going Games");
//    }).catch(^(NSError *err){
//        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
//        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//        [alert show];
//    });
//
//    [JHGameNetworkHelper getUpcomingGames].then(^(NSDictionary *json){
//        NSLog(@"Upcoming Games");
//    }).catch(^(NSError *err){
//        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
//        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//        [alert show];
//    });
    self.upcomingView = [[JHUpcomingView alloc] initWithFrame:bounds];
    self.goingView = [[UIView alloc] initWithFrame:bounds];
    self.organizingView = [[UIView alloc] initWithFrame:bounds];

    [self.eventControl addTarget:self action:@selector(segControlClicked:) forControlEvents:UIControlEventValueChanged];
    
    [self loadUpcomingView];
}

- (void)segControlClicked:(id)sender
{
    switch (self.eventControl.selectedSegmentIndex) {
        case 0:
            [self loadUpcomingView];
            break;
        case 1:
            [self loadGoingView];
            break;
        default:
            [self loadOrganizingView];
    } ;
}

- (void)loadUpcomingView
{
    [self loadUpcomingGames];
    
    [self.goingView removeFromSuperview];
    [self.organizingView removeFromSuperview];
    [self.view addSubview:self.upcomingView];
}

- (void)loadUpcomingGames
{
    NSMutableArray *organizingGames = [[NSMutableArray alloc] init];
    [JHGameNetworkHelper getOrganizingGames].then(^(NSArray *json){
        for (NSDictionary *gameArray in json){
            NSError* error = nil;
            JHGame *game = [[JHGame alloc] initWithDictionary:gameArray error:&error];
            if(game)
                [organizingGames addObject:game];
        }
        self.organizingGames = organizingGames;
        [self.upcomingView updateWithGames:self.organizingGames];
    }).catch(^(NSError *err){
        NSData *response = err.userInfo[PMKURLErrorFailingDataKey];
        id json = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:json[@"error"][0] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    });
}
- (void)loadGoingView
{
    [self.upcomingView removeFromSuperview];
    [self.organizingView removeFromSuperview];
    [self.view addSubview:self.goingView];
}
- (void)loadOrganizingView
{
    [self.goingView removeFromSuperview];
    [self.upcomingView removeFromSuperview];
    [self.view addSubview:self.organizingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
