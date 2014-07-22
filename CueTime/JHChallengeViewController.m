//
//  JHSecondViewController.m
//  CueTime
//
//  Created by Tian He on 5/12/14.
//  Copyright (c) 2014 JiHeCo. All rights reserved.
//

#import "JHChallengeViewController.h"
#import "JHUpcomingViewController.h"
#import "JHGoingViewController.h"
#import "JHOrganizingViewController.h"

@interface JHChallengeViewController ()

@property (strong, nonatomic) JHUpcomingViewController *upcomingVC;
@property (strong, nonatomic) JHGoingViewController *goingVC;
@property (strong, nonatomic) JHOrganizingViewController *organizingVC;

@end

@implementation JHChallengeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.eventControl addTarget:self action:@selector(segControlClicked:) forControlEvents:UIControlEventValueChanged];
    
    self.upcomingVC = [[JHUpcomingViewController alloc] init];
    self.goingVC = [[JHGoingViewController alloc] init];
    self.organizingVC = [[JHOrganizingViewController alloc] init];
    
    [self.view addSubview:self.upcomingVC.view];
}

- (void)segControlClicked:(id)sender
{
    switch (self.eventControl.selectedSegmentIndex) {
        case 0:
            [self.goingVC.view removeFromSuperview];
            [self.organizingVC.view removeFromSuperview];            
            [self.view addSubview:self.upcomingVC.view];
            break;
        case 1:
            [self.upcomingVC.view removeFromSuperview];
            [self.organizingVC.view removeFromSuperview];
            [self.view addSubview:self.goingVC.view];
            break;
        default:
            [self.goingVC.view removeFromSuperview];
            [self.upcomingVC.view removeFromSuperview];
            [self.view addSubview:self.organizingVC.view];
    } ;
}


@end
