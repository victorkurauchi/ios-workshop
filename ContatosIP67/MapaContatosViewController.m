//
//  MapaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5128 on 28/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "MapaContatosViewController.h"

@interface MapaContatosViewController ()

@end

@implementation MapaContatosViewController

- (id) init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Localizacao";
        UIImage * imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imagemTabItem tag:0];
        
        self.tabBarItem = tabItem;
        
        ContatoDAO *dao = [ContatoDAO getInstance];
        self.contatos = dao.lista;
        NSLog(@"%@",self.contatos);
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKUserTrackingBarButtonItem *gps = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = gps;
    
    self.manager = [CLLocationManager new];
    [self.manager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [self.mapa addAnnotations:self.contatos];
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.mapa removeAnnotations:self.contatos];
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
