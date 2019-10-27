//
//  ContentVC.m
//  Lesson07
//
//  Created by Maksim Nosov on 27.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ContentVC.h"

@interface ContentVC ()

@property (nonatomic, strong) UIImageView *catImageView;
@property (nonatomic, strong) UILabel *catNameLabel;

@end

@implementation ContentVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.catImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100,
                                                                          [UIScreen mainScreen].bounds.size.height / 2,
                                                                          200,
                                                                          200)];
        [self.catImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.catImageView.layer setCornerRadius:8];
        [self.catImageView setClipsToBounds:YES];
        [self.view addSubview:self.catImageView];
        
        self.catNameLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100,
                                                                      [UIScreen mainScreen].bounds.size.height / 2 + 200,
                                                                      200,
                                                                      50)];
        [self.catNameLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightHeavy]];
        [self.catNameLabel setNumberOfLines:0];
        [self.catNameLabel setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.catNameLabel];
        
    }
    return self;
}

- (void)setCatImage:(UIImage *)catImage {
    [self.catImageView setImage:catImage];
}

- (void)setCatName:(NSString *)catName {
    [self.catNameLabel setText:catName];
}

@end
