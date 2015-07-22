//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5128 on 20/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dao = [ContatoDAO getInstance];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDadosForm {
    
    Contato *c = [Contato new];
    c.nome = self.nome.text;
    c.telefone = self.telefone.text;
    c.email = self.email.text;
    c.site = self.site.text;
    c.endereco = self.endereco.text;
    
    [self.dao insere:c];
    self.nome.text = @"";
    self.telefone.text = @"";
    self.email.text = @"";
    self.site.text = @"";
    self.endereco.text = @"";
    
    [self.nome becomeFirstResponder];
}

@end
