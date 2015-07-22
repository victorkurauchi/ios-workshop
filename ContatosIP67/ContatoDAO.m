//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ContatoDAO.h"


@implementation ContatoDAO

static ContatoDAO *daoCriado = nil;

-(id) init {
    self = [super init];
    if (self) {
        _lista = [NSMutableArray new];
    }
    
    return self;
}

- (void) insere:(Contato *)contato {
    [self.lista addObject:contato];
    NSLog(@"CONTATOS: %@", self.lista);
//    
//    for (<#type *object#> in <#collection#>) {
//        <#statements#>
//    }
}

+ (id) getInstance {
    if (!daoCriado) {
        daoCriado = [ContatoDAO new];
    }
    return daoCriado;
}

@end
