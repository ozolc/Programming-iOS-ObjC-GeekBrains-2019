//
//  LocationService.m
//  Lesson04
//
//  Created by Maksim Nosov on 23/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "LocationService.h"

@interface LocationService () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        [self.locationManager requestAlwaysAuthorization];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Доступ к геолокации разрешен.");
        [self.locationManager startUpdatingLocation];
    } else if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Доступ к геолокации запрещен.");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (self.currentLocation == nil) {
        self.currentLocation = [locations firstObject];
        NSLog(@"%@", [locations firstObject]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationUpdate object:[locations firstObject]];
        [self.locationManager startUpdatingLocation];
    }
}

@end
