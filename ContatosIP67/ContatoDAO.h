//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property (strong, readonly) NSMutableArray* lista;

- (void) insere:(Contato *)contato;
- (Contato *) getPorPosicao:(NSInteger)posicao;
- (NSInteger) getTotal;
- (void) deletePorPosicao:(NSInteger)posicao ;

+ (id) getInstance;

@end
