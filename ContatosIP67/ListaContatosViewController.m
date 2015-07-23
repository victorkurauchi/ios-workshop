//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController

- (id) init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *add = [[ UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target: self
                                                                              action: @selector(mostraForm)];
        self.navigationItem.rightBarButtonItem = add;
    }
    
    return self;
}

- (void) mostraForm {
    NSLog(@"huehueh");
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *f = [board instantiateViewControllerWithIdentifier:@"formContato"];
    
    [self.navigationController pushViewController:f animated:YES];
}

@end
