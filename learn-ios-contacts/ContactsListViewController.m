//
//  ContactsListViewController.m
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/18/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import "ContactsListViewController.h"
#import "ContactFormViewController.h"

@implementation ContactsListViewController

- (id)init {
    if (self = [super init]) {        
        self.navigationItem.title = @"Contacts";
        
        UIBarButtonItem *showFormButton =
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showContactForm)];
        self.navigationItem.rightBarButtonItem = showFormButton;
    }
    
    return self;
}

- (void)showContactForm {
    // O objetivo do método atual é exibir o formulário
    // de contato para o usuário. Para isso precisa-se
    // da referência para esse formulário. Como o esse
    // formulário é exibido pelo storyboard, instanci-
    // amos o storyboard primeiro.
    
    UIStoryboard *storyboard =
        [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // A partir da instância do storyboard pegamos uma referência
    // para o ContactFormViewController através do identificador
    // "ContactForm", que precisa ser manualmente configurado
    // por dentro do Identity Inspector do storyboard.
    
    ContactFormViewController *form =
        [storyboard instantiateViewControllerWithIdentifier:@"ContactForm"];
    
    // Com a referência para o ContactsFormViewController em mãos,
    // colocamos essa referência na pilha de navegação do
    // UINavigationController atual.
    
    // Toda View Controller possui uma referência chamada
    // navigationController, que aponta para o possível
    // UINavigationController que esteja exibindo
    // a View Controller atual.
    
    // No nosso caso, de fato a View Controller atual (ContactsList)
    // está sendo exibida por um UINavigationController, logo
    // a chamada para self.navigationController retorna uma
    // referência para o navigation controller corrnete.
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
