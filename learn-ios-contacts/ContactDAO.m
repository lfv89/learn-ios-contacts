//
//  ContactDAO.m
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/12/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import "ContactDAO.h"

@implementation ContactDAO

static ContactDAO *dao = nil;

// Comparando com o Java, o init se comporta como o
// construtor da classe e o alloc se comportaria
// como o new do Java.

// No fim das contas, o init é apenas mais um método de
// instância como qualquer outro, nada na linguagem o
// caracteriza como um construtor, é apenas uma mera
// convenção usar init como o construtor.

// Essa é a estratégia padrão na hora de sobrescrever um
// construtor. Finalmente, por ser um mero método de
// instância, ele pode ser chamado ou não.

- (id)init {
    if (self = [super init]) {
        _contacts = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (id)getInstance {
    if (!dao) {
        dao = [[ContactDAO alloc] init];
    }
    
    return dao;
}

- (void)addContact:(Contact *)contact {
    [self.contacts addObject:contact];
    NSLog(@"Contacts: %@", self.contacts);
}

- (Contact *)getContactAtPosition:(NSInteger)position {
    return self.contacts[position];
}

@end