//
//  Contato.h
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/9/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

// A palavra chave strong está relacionada com gerenciamento
// de memória. O padrão é assign. Quando strong é utilizado,
// estamos garantindo que todos os dados do contato perma-
// neçam na memória enquanto a instância de Contato que se
// refere a elas existir.

@property (strong) NSString *name;
@property (strong) NSString *phone;
@property (strong) NSString *email;
@property (strong) NSString *address;
@property (strong) NSString *site;

@end
