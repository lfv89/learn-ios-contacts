//
//  Contato.m
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/9/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import "Contact.h"

@implementation Contact

// Contato herda o método description da classe
// NSObject. Esse método é chamado toda vez que
// se faz necessário ter a representação de um
// objeto em formato NSString.

- (NSString *) description {
    return [NSString stringWithFormat:@"Name: %@, Phone: %@, Email: %@, Address: %@, Site: %@", self.name, self.phone, self.email, self.address, self.site];
}

@end
