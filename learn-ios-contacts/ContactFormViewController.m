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
    self.contact = [[Contact alloc] init];
    
    self.contact.name    = [self.name    text];
    self.contact.phone   = [self.phone   text];
    self.contact.email   = [self.email   text];
    self.contact.address = [self.address text];
    self.contact.site    = [self.site    text];
}

@end