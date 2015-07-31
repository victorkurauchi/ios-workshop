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
#import <QuartzCore/QuartzCore.h>
#import <CoreLocation/CoreLocation.h>

@protocol FormularioContatoViewControllerDelegate <NSObject>

- (void) contatoAtualizado:(Contato *) contato;
- (void) contatoAdicionado:(Contato *) contato;

@end

@interface FormularioContatoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

-(IBAction)selecionaFoto:(id)sender;

@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (weak, nonatomic) IBOutlet UIButton *foto;
@property (weak, nonatomic) IBOutlet UIButton *buttonGPS;
@property (strong) ContatoDAO *dao;
@property (strong) Contato *contato;
@property UIBarButtonItem *adiciona;

- (IBAction)buscarCoordenadas:(id)sender;

@end

