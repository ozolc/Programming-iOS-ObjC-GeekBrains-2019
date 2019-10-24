//
//  TabBar.m
//  Lesson05
//
//  Created by Maksim Nosov on 24/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "TabBar.h"
#import "ViewController.h"

@interface TabBar ()

@end

@implementation TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        ViewController *first = [[ViewController alloc] init];
        first.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Picker" image:[UIImage imageNamed: @"collection"] tag:0];
        
        UIViewController *second = [[UIViewController alloc] init];
        second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:[UIImage imageNamed: @"image"] tag:0];
        [second.view setBackgroundColor:[UIColor greenColor]];
        
        self.viewControllers = @[first, second];
        [self.tabBar setTintColor:[UIColor blueColor]];
        [self setSelectedIndex:0];
        return self;
    }
    return self;
}

@end
