//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5128 on 20/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDAO.h"

@interface FormularioContatoViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;
@property (strong) ContatoDAO *dao;
@property (strong) Contato *contato;
@property UIBarButtonItem *adiciona;

@end

