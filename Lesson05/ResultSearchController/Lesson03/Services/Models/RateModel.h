//
//  RateModel.h
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RateModel : NSObject

@property (nonatomic, strong) NSString *rateName;
@property (nonatomic, strong) NSNumber *rateValue;

- (instancetype)initFromDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
