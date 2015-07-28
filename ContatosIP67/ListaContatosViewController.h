//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "ContatoDAO.h"
#import "GerenciadorDeAcoes.h"

@interface ListaContatosViewController : UITableViewController<FormularioContatoViewControllerDelegate>

@property (strong) ContatoDAO *dao;
@property (strong) Contato *selected;
@property NSInteger linhaDestaque;
@property (readonly) GerenciadorDeAcoes *gerenciador;

- (void) exibeMaisAcoes:(UIGestureRecognizer *)gesture;

@end
