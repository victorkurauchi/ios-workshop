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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO getInstance];
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selected = [self.dao getPorPosicao:indexPath.row];
    [self mostraForm];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao deletePorPosicao:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (void) mostraForm {
    NSLog(@"huehueh");
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *f = [board instantiateViewControllerWithIdentifier:@"formContato"];
    
    if (self.selected) {
        f.contato = self.selected;
    }
    
    [self.navigationController pushViewController:f animated:YES];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao getTotal];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    Contato *c = [self.dao getPorPosicao:indexPath.row];
    cell.textLabel.text = c.nome;
    
    return cell;
}


@end
