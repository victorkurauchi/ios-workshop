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
    if (self.contato) {
        NSLog(@"AINDA TEM");
        [self populaForm];
    } else {
        // [self clearForm];
    }
    
    [self renderizaRounded];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {
   // [self clearForm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UIImagePickerDelegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imagem = [info valueForKey:UIImagePickerControllerEditedImage];
    // if url, download media and call it as UIImage
    [self.foto setBackgroundImage:imagem forState:UIControlStateNormal];
    [self.foto setTitle:nil forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// ActionSheetDelegate
- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIImagePickerController *picker = [UIImagePickerController new];
    
    picker.allowsEditing = YES;
    picker.delegate = self;
    
    switch (buttonIndex) {
        case 0:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        break;
            
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        break;
        default:
        break;
    }
    
    [self presentViewController:picker animated:YES completion:nil];
}

// Methods

- (void) renderizaRounded {
    self.foto.layer.cornerRadius = self.foto.frame.size.height/2.0;
    self.foto.clipsToBounds = YES;
    self.foto.layer.borderWidth = 1.0;
    self.foto.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.foto.layer.backgroundColor =[UIColor groupTableViewBackgroundColor].CGColor;
    self.foto.backgroundColor = nil;
}

- (IBAction)selecionaFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"tem");
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Escolha a foto" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Biblioteca", nil];
        
        [sheet showInView:self.view];
        
    } else {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)populaForm {
    [self modificaBotaoParaAtualizar];
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
    self.endereco.text = self.contato.endereco;
    
    if (self.contato.foto) {
        [self.foto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
        [self.foto setTitle:nil forState:UIControlStateNormal];
    }
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
    
    UIImage *fotoUploaded = [self.foto backgroundImageForState:UIControlStateNormal];
    if (fotoUploaded) {
        self.contato.foto = fotoUploaded;
    }
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
