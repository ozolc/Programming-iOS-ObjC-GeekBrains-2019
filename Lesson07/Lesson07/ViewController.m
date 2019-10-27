//
//  ViewController.m
//  Lesson07
//
//  Created by Maksim Nosov on 27.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"
#import "PageVC.h"
#import "NotificationService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    [UIView animateWithDuration:2
                     animations:^{
        [redView setFrame:CGRectMake(100, 500, 50, 50)];
    }
                     completion:^(BOOL finished) {
        [UIView animateWithDuration:2
                         animations:^{
            [redView.layer setCornerRadius:25];
        }
                         completion:^(BOOL finished) {
            [UIView animateWithDuration:2
                             animations:^{
                [redView setBackgroundColor:[UIColor greenColor]];
            }];
        }];
    }];
    
    UIButton *slidesShowButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    [slidesShowButton setTitle:@"Press to slides showing" forState:UIControlStateNormal];
    [slidesShowButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [slidesShowButton addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:slidesShowButton];
    
    UIButton *sendPush = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 300, 50)];
    [sendPush setTitle:@"Press to push" forState:UIControlStateNormal];
    [sendPush setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sendPush addTarget:self action:@selector(pressPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendPush];
}

- (void)pressButton {
    PageVC *vc = [[PageVC alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                   navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                 options:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pressPush {
    [[NotificationService sharedInstance] sendNotification:NotificationMake(@"Hello",
                                                                           @"World",
                                                                           [[NSDate new] dateByAddingTimeInterval:5],
                                                                           [NSURL URLWithString:@"https://http.cat/101"])];
}

@end
