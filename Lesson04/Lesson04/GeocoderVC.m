//
//  GeocoderVC.m
//  Lesson04
//
//  Created by Maksim Nosov on 23/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "GeocoderVC.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "LocationService.h"

@interface GeocoderVC ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) LocationService *loc;

@end

@implementation GeocoderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 50)];
    [self.textField setBorderStyle:UITextBorderStyleLine];
    [self.view addSubview:self.textField];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, 300, 60)];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.loc = [[LocationService alloc] init];
}

- (void)pressButton {
    [self locationFromAddress:self.textField.text];
//    [self addressFromLocation:[[CLLocation alloc] initWithLatitude:56.86000800
//                                                          longitude:35.90893010]];
}

- (void)addressFromLocation:(CLLocation*)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0 ) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.name);
            }
        }
    }];
}

- (void)locationFromAddress:(NSString*)address {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0 ) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
                dispatch_async(dispatch_get_main_queue(), ^{
                    ViewController *vc = [[ViewController alloc] init];
                    vc.coordinate = placemark.location;
                    [self.navigationController pushViewController:vc animated:true];
                });
            }
        }
    }];
}

@end
