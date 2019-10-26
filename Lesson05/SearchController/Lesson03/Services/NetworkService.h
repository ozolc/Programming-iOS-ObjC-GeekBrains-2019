//
//  NetworkService.h
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (instancetype)sharedInstance;

- (void)getAllRates:(void (^)(NSArray *rates))completion;

@end

NS_ASSUME_NONNULL_END
