//
//  CoreDataService.h
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Humans+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataService : NSObject

+ (instancetype)sharedInstance;
- (void)createHumanWithName:(NSString*)name withAge:(NSNumber*)age withCity:(NSString*)city withSex:(BOOL)sex;
- (NSArray*)getAllHumans;

@end

NS_ASSUME_NONNULL_END
