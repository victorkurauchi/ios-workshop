//
//  MapaContatosViewController.h
//  ContatosIP67
//
//  Created by ios5128 on 28/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapaContatosViewController : UIViewController

@property (weak,nonatomic) IBOutlet MKMapView *mapa;
@property (strong) CLLocationManager *manager;

@end
