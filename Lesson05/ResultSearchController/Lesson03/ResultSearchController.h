//
//  ResultSearchController.h
//  Lesson03
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResultSearchController : UITableViewController

@property (nonatomic, strong) NSArray *results;

- (void)update;

@end

NS_ASSUME_NONNULL_END
