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
#import "ContatoDAO.h"
#import "Contato.h"

@interface MapaContatosViewController : UIViewController< MKMapViewDelegate >

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong) CLLocationManager *manager;
@property (weak, nonatomic) NSMutableArray *contatos;

@end
