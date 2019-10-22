//
//  DetailVievViewController.m
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UILabel *rateNameLabel;
@property (nonatomic, strong) UILabel *rateValueLabel;

@property (nonatomic, strong) RateModel *model;

@end

@implementation DetailViewController

- (instancetype)initWithModel:(RateModel*)model {
    self = [super init];
    
    if (self) {
        [self setModel:model];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:self.model.rateName];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.rateNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  150,
                                                                  self.view.bounds.size.width,
                                                                   100)];
    UIFont *font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
    [self.rateNameLabel setFont:font];
    [self.rateNameLabel setText:self.model.rateName];
    [self.view addSubview:self.rateNameLabel];
    
    self.rateValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  250,
                                                                  self.view.bounds.size.width,
                                                                   100)];
    [self.rateValueLabel setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightLight]];
    [self.rateValueLabel setText:[self.model.rateValue stringValue]];
    [self.view addSubview:self.rateValueLabel];
    
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 50, 50)];
//    [backButton setTitle:@"Press me" forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backButtonTap) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backButton];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(backButtonTap)];
    [self.navigationItem setLeftBarButtonItem:item];
}

- (void)backButtonTap {
    if (self.navigationController.navigationController == nil) {
        // Present
        [self.navigationController dismissViewControllerAnimated:true completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end
