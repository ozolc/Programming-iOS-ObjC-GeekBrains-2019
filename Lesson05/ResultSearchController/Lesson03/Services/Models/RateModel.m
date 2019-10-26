//
//  RateModel.m
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "RateModel.h"

@implementation RateModel

- (instancetype)initFromDictionary:(NSDictionary*)dictionary {
    self = [super init];
    
    if (self) {
        self.rateName = [dictionary valueForKey:@"rateName"];
        self.rateValue = [dictionary valueForKey:@"rateValue"];
    }
    
    return self;
}

@end
