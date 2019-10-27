//
//  ContentVC.h
//  Lesson07
//
//  Created by Maksim Nosov on 27.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentVC : UIViewController

@property (nonatomic, strong) UIImage *catImage;
@property (nonatomic, strong) NSString *catName;
@property (nonatomic) int index;

@end

NS_ASSUME_NONNULL_END
