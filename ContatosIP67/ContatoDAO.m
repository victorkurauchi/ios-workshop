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
}

- (void) atualizaContato:(Contato *)contato NaPosicao:(NSInteger *)posicao {
    
}

- (Contato *) getPorPosicao:(NSInteger)posicao {
    return self.lista[posicao];
}

- (NSInteger) buscaPosicaoPorContato:(Contato *) contato {
    return [self.lista indexOfObject:contato];
}

- (void) deletePorPosicao:(NSInteger)posicao {
    [self.lista removeObject:self.lista[posicao]];
}

- (NSInteger) getTotal {
    return [self.lista count];
}

+ (id) getInstance {
    if (!daoCriado) {
        daoCriado = [ContatoDAO new];
    }
    return daoCriado;
}

@end
