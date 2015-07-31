//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5128 on 20/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(NSString *) description {
    return _nome;
}

-(CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

-(NSString *) title {
    return self.nome;
}

-(NSString *) subtitle {
    return self.endereco;
}

@end
