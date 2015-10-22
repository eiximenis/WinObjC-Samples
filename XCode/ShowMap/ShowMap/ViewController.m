//
//  ViewController.m
//  ShowMap
//
//  Created by Eduard Tomàs on 20/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//

#ifndef WINOBJC
#import <MapKit/MapKit.h>
#else
#import <UWP/WindowsUIXamlControls.h>
#import <UWP/WindowsUIXamlControlsMaps.h>
#endif

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#ifndef WINOBJC
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:mapView];
#else
    WUXCMMapControl* mapElement= [WUXCMMapControl create];
    mapElement.MapServiceToken=@"NHsFIjVuEZfDMhkTe1hy~RBJH9Rih9OemUAoD0yogVA~Ag1kHArXjAg2Hck8lveAzRAlSDqy21FTKrXY1sRe5XOLKLDkL-DIsg45inihpYKu";
    UIView *mapView = [[UIView alloc] initWithFrame: self.view.frame];
    [mapView setNativeElement: mapElement];
    [self.view addSubview:mapView];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
