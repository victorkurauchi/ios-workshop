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
        self.navigationItem.title = @"Cadastro";
        _adiciona = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona"
                                             style:UIBarButtonItemStylePlain
                                            target:self
                                            action: @selector(addContato)];
        self.navigationItem.rightBarButtonItem = _adiciona;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.contato) {
        NSLog(@"AINDA TEM");
        [self populaForm];
    } else {
        [self clearForm];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [self clearForm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populaForm {
    [self modificaBotaoParaAtualizar];
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
    self.endereco.text = self.contato.endereco;
}

- (void) modificaBotaoParaAtualizar {
    [_adiciona setAction:@selector(atualizaContato)];
    [_adiciona setTitle:@"Atualizar"];
}

- (void)getDadosForm {
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.site = self.site.text;
    self.contato.endereco = self.endereco.text;
}

- (void) addContato {
    self.contato = [Contato new];
    [self getDadosForm];
    
    if ([self isValidForm:self.contato]) {
        [self.dao insere:self.contato];
        [self clearForm];
        
        if (self.delegate) {
            [self.delegate contatoAdicionado:self.contato];
        }
        [self direcionaUsuario];
    } else {
        [self alertError];
    }
}

- (void) atualizaContato {
    [self getDadosForm];
    if (self.delegate) {
        [self.delegate contatoAtualizado:self.contato];
    }
    [self direcionaUsuario];
}

- (void) direcionaUsuario {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) isValidForm:(Contato *) contato {
    if ([contato.nome  isEqual: @""] || [contato.telefone  isEqual: @""]|| [contato.email  isEqual: @""]) {
        return NO;
    } else {
        return YES;
    }
}

- (void) clearForm {
    self.nome.text = @"";
    self.telefone.text = @"";
    self.email.text = @"";
    self.site.text = @"";
    self.endereco.text = @"";
    
    [self.nome becomeFirstResponder];
}

- (void) alertError {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Caelum"
                                                                   message:@"Preencha todos campos"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
