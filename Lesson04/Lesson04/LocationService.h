//
//  LocationService.h
//  Lesson04
//
//  Created by Maksim Nosov on 23/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define kLocationUpdate @"kLocationUpdate"

NS_ASSUME_NONNULL_BEGIN

@interface LocationService : NSObject

@property (strong, nonatomic) CLLocation *currentLocation;

@end

NS_ASSUME_NONNULL_END
