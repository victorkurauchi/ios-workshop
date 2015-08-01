//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios5128 on 21/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ContatoDAO.h"
#import "AppDelegate.h"

@implementation ContatoDAO

static ContatoDAO *daoCriado = nil;

-(id) init {
    self = [super init];
    if (self) {
        _lista = [NSMutableArray new];
        
        
        AppDelegate *app = [self getAppDelegate];
        self.context = app.managedObjectContext;
        
        [self carregaContatos];
    }
    
    return self;
}

- (AppDelegate *) getAppDelegate {
    return [[UIApplication sharedApplication] delegate];
}

- (void) carregaContatos {
    NSFetchRequest *busca = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSSortDescriptor *ordemAlfabetica = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    busca.sortDescriptors = @[ ordemAlfabetica ];
    NSArray *contatosImutaveis = [self.context executeFetchRequest:busca error:nil];
    _lista = [contatosImutaveis mutableCopy];
}

- (void) inserirDados {
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    BOOL contatoInserido = [config boolForKey:@"contato_inserido"];
    if (!contatoInserido) {
        Contato *contatoInicial = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.context];
        
        contatoInicial.nome = @"Victor";
        contatoInicial.email = @"Victor@gmail.com";
        contatoInicial.endereco = @"Rua gaetano angeli, 148";
        contatoInicial.site = @"http://github.com/victorkurauchi";
        contatoInicial.telefone = @"977544440";
        contatoInicial.latitude = [NSNumber numberWithDouble:-23.5883034];
        contatoInicial.longitude = [NSNumber numberWithDouble:-46.632369];
        
        [[self getAppDelegate] saveContext];
        [config setBool:YES forKey:@"contato_inserido"];
        [config synchronize];
    }
}

- (void) insere:(Contato *)contato {
    [self.lista addObject:contato];
    NSLog(@"CONTATOS: %@", self.lista);
}

- (Contato *) novoContato {
    return [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.context];
}

- (void) atualizaContato:(Contato *)contato NaPosicao:(NSInteger *)posicao {
    
}

- (Contato *) getPorPosicao:(NSInteger)posicao {
    return self.lista[posicao];
}

- (NSInteger) buscaPosicaoPorContato:(Contato *) contato {
    return [self.lista indexOfObject:contato];
}

- (void) deletePorPosicao:(NSInteger)posicao {
    [self.context deleteObject:self.lista[posicao]];
    [self.lista removeObject:self.lista[posicao]];
}

- (NSInteger) getTotal {
    return [self.lista count];
}

+ (id) getInstance {
    if (!daoCriado) {
        daoCriado = [ContatoDAO new];
    }
    return daoCriado;
}

@end
