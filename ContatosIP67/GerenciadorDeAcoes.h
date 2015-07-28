//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios5128 on 27/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contato.h"
#import "CategoryCommunicator.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (strong) Contato *contato;
@property UIViewController *controller;

-(id)initWithContato:(Contato *)contato;
-(void)acoesDoController:(UIViewController *)controller;

@end
