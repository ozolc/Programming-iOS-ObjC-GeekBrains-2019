//
//  DetailViewController.h
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

- (instancetype)initWithModel:(RateModel*)model;


@end

NS_ASSUME_NONNULL_END
