//
//  MapViewController.m
//  PostOffice
//
//  Created by Utsav Kumar on 11/06/18.
//  Copyright © 2018 Home. All rights reserved.
//

#import "MapViewController.h"
#import <Mapkit/Mapkit.h>

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MKMapView *mapView  = [[MKMapView alloc ] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mapView setMapType:0];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    [mapView setShowsUserLocation:YES];
    
    [self.view addSubview:mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];

    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude = 28.499674;
    pinCoordinate.longitude = 77.0700598;
    
    [annotation setCoordinate:pinCoordinate];
    [annotation setTitle:@"My Cordinate"]; //You can set the subtitle too
    [mapView addAnnotation:annotation];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
