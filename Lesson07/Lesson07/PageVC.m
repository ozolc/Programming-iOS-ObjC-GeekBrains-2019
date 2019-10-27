//
//  PageVC.m
//  Lesson07
//
//  Created by Maksim Nosov on 27.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "PageVC.h"
#import "ContentVC.h"

#define CONTENT_COUNT 4

@interface PageVC () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation PageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createContent];
    
    ContentVC *startVC = [self viewControllerAtIndex:0];
    [self setViewControllers:@[startVC]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    
    [self setDataSource:self];
    [self setDelegate:self];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,
                                                                       self.view.bounds.size.height - 100,
                                                                       self.view.bounds.size.width,
                                                                       50)];
    [self.pageControl setNumberOfPages:CONTENT_COUNT];
    [self.pageControl setTintColor:[UIColor darkGrayColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [self.view addSubview:self.pageControl];
}

- (void)createContent {
    self.images = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"200"],
                   [UIImage imageNamed:@"202"],
                   [UIImage imageNamed:@"401"],
                   [UIImage imageNamed:@"404"],
                   nil];
    
    self.names = [NSArray arrayWithObjects:
                  @"Феликс",
                  @"Васька",
                  @"Чиж",
                  @"Рыжик",
                  nil];
}

- (ContentVC*)viewControllerAtIndex:(int)index {
    if (index < 0 || index >= CONTENT_COUNT) {
        return nil;
    }
    
    ContentVC *vc = [[ContentVC alloc] init];
    [vc setCatImage:[self.images objectAtIndex:index]];
    [vc setCatName:[self.names objectAtIndex:index]];
    [vc setIndex:index];
    return vc;
}

#pragma mark - UIPageViewControllerDelegate -

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        int index = ((ContentVC*)[pageViewController.viewControllers firstObject]).index;
        [self.pageControl setCurrentPage:index];
    }
}

#pragma mark - UIPageViewControllerDataSource -

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    int index = ((ContentVC*)viewController).index;
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    int index = ((ContentVC*)viewController).index;
    index++;
    return [self viewControllerAtIndex:index];
}

@end
