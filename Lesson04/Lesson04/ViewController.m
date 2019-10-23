//
//  ViewController.m
//  Lesson04
//
//  Created by Maksim Nosov on 23/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"

@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) LocationService *service;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.service = [[LocationService alloc] init];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.mapView setDelegate:self];
    
//    CLLocationCoordinate2D coordinate = self.coordinate.coordinate; // CLLocationCoordinate2DMake(55.7522200, 37.6155600);
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
//    [mapView setRegion:region animated:true];
//
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//    annotation.title = @"Title";
//    annotation.subtitle = @"Subtitle";
//    annotation.coordinate = coordinate;
//    [mapView addAnnotation:annotation];
    
    [self.mapView setMapType:MKMapTypeSatelliteFlyover];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationWasUpdated:) name: @"kLocationUpdate" object:nil];
    
    [self.view addSubview:self.mapView];
}

- (void)locationWasUpdated:(NSNotification*)notification {
    CLLocation *location = notification.object;
    
    CLLocationCoordinate2D coordinate = location.coordinate; // CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:true];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Title";
    annotation.subtitle = @"Subtitle";
    annotation.coordinate = coordinate;
    [self.mapView addAnnotation:annotation];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    static NSString *identifier = @"Marker";
    MKMarkerAnnotationView *marker = (MKMarkerAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!marker) {
        marker = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        marker.canShowCallout = true;
        marker.calloutOffset = CGPointMake(-5.0, 5.0);
        marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    marker.annotation = annotation;
    
    return marker;
}

@end
