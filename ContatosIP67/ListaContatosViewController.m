//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@implementation ListaContatosViewController

- (void) contatoAtualizado:(Contato *) contato {
    NSLog(@"contatoAtualizado %@", contato.nome);
    self.linhaDestaque = [self.dao buscaPosicaoPorContato:contato];
}
- (void) contatoAdicionado:(Contato *) contato {
    NSLog(@"CONTATO ADICIONADO %@", contato.nome);
    self.linhaDestaque = [self.dao buscaPosicaoPorContato:contato];
}

- (id) init {
    self = [super init];
    if (self) {
        self.linhaDestaque = -1;
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *add = [[ UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target: self
                                                                              action: @selector(mostraForm)];
        self.navigationItem.rightBarButtonItem = add;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO getInstance];
        
        UIGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(exibeMaisAcoes:)];
        [self.tableView addGestureRecognizer:longPress];
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void) viewDidAppear:(BOOL)animated {
    if (self.linhaDestaque >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.linhaDestaque inSection:0];
        
        [self.tableView selectRowAtIndexPath:indexPath
                                    animated:NO
                              scrollPosition:UITableViewScrollPositionNone];
        
        [self.tableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionNone
                                      animated:YES];
        
        self.linhaDestaque = -1;
    }
    
    self.selected = nil;
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

- (void)exibeMaisAcoes:(UIGestureRecognizer *) gesture {
    NSLog(@"OLOKO %ld", (long)gesture.state);
}

- (void) mostraForm {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *f = [board instantiateViewControllerWithIdentifier:@"formContato"];
    f.delegate = self;
    
    if (self.selected) {
        NSLog(@"SELECIONEI");
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
