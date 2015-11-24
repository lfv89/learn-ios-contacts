//
//  ViewController.m
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/8/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import "ContactFormViewController.h"
#import "Contact.h"

@interface ContactFormViewController ()

@end

@implementation ContactFormViewController

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.dao = [ContactDAO getInstance];
        
        self.navigationItem.title = @"Contact Form";

        UIBarButtonItem *addButton =
            [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addContact)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
    
    return self;
}

- (void)viewDidLoad {
    // Esse código verifica se a ContactFormViewController possui algum contato,
    // e caso possua, altere botão superior direito na barra de navegação
    // para ser um botão de update.
    
    // É razoavel pensar em colocar esse código como um if/else dentro do construtor da classe
    /// atual, mas deve-se lembrar que uma instancia ContactFormViewController
    // só recebe o contato após a sua inicializacao. Essa atribuição ocorre
    // quando o botão "+" é clicado na ContactsFormViewController
    // e o método showContactForm é executado.
    if (self.contact) {
        UIBarButtonItem *updateButton =
            [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStylePlain target:self action:@selector(updateContact)];
        self.navigationItem.rightBarButtonItem = updateButton;
        
        [self populateFormWithContact];
    }
}

- (void)addContact {
    [self buildContact];
    [self.dao addContact:self.contact];
    
    // A contactFormViwController é exibida por um UINavigationController,
    // logo possui acesso a referência dele. O método abaixo faz com que,
    // após o contato ter sido adicionado, a lista de contatos seja
    // novamente exibida com uma animação.
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buildContact {
    if (!self.contact) {
        self.contact = [[Contact alloc] init];
    }
    
    self.contact.name    = [self.name    text];
    self.contact.phone   = [self.phone   text];
    self.contact.email   = [self.email   text];
    self.contact.address = [self.address text];
    self.contact.site    = [self.site    text];
}

- (void)updateContact {
    [self buildContact];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)populateFormWithContact {
    self.name.text    = self.contact.name;
    self.phone.text   = self.contact.phone;
    self.email.text   = self.contact.email;
    self.address.text = self.contact.address;
    self.site.text    = self.contact.site;
}

@end