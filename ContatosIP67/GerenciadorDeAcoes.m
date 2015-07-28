//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5128 on 27/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

-(id)initWithContato:(Contato *)contato {
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    
    return self;
}

-(void)acoesDoController:(UIViewController *)controller {
    self.controller = controller;
    UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:self.contato.nome
                                                        delegate:self cancelButtonTitle:@"Cancelar"
                                          destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar email", @"Visualizar site", @"Abrir mapa", nil];
    [opcoes showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"CLIQUEIIIIIII RAPA");
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
            
        case 1:
            [self enviarEmail];
            break;
        
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self abrirMapa];
            break;
        default:
            break;
    }
}

-(void)makeRequest {
    CategoryCommunicator *communicator = [CategoryCommunicator new];
    [communicator listCategories];
}

-(void)enviarEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *enviador = [MFMailComposeViewController new];
        enviador.mailComposeDelegate = self;
        [enviador setToRecipients:@[ self.contato.email]];
        [enviador setSubject:@"Caelum"];
        [self.controller presentViewController:enviador animated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Ooops" message:@"not possible to send email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show ];
    }
}

-(void)ligar {
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"wtf");
    if ([device.model isEqualToString:@"iPhone"]) {
        NSLog(@"hiphone");
        NSString *numero = [NSString stringWithFormat:@"tel: %@",self.contato.telefone];
        [self abrirAppComURL:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Ooops" message:@"not found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show ];
    }
    
}

-(void)abrirSite {
    NSString *url = self.contato.site;
    [self abrirAppComURL:url];
}

-(void)abrirMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",self.contato.endereco]
                        stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAppComURL:url];
}

-(void)abrirAppComURL:(NSString *) url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

@end
