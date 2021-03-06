//
//  ViewController.h
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/8/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDAO.h"

@interface ContactFormViewController : UIViewController

// Da mesma forma que colocamos a palavra IBAction para
// especificar ao Interface Builder que o método estava
// disponível na view para ser vinculado ao botão,
// especificamos o IBOutlet para dizer que essas
// propriedades também estão disponíveis para a
// view do formulário utilizar uma Outlet

// O marcador IBOutlet fará com que os objetos criados
// na View fiquem disponíveis para a manipulação
// no Controller.

// Ou seja, nesse caso temos uma comunicação a partir
// do Controller para a View, o que caracteriza uma
// Outlet (Controller -> View)

@property IBOutlet UITextField *name;
@property IBOutlet UITextField *phone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *address;
@property IBOutlet UITextField *site;

@property (strong) ContactDAO *dao;
@property (strong) Contact *contact;

- (void)addContact;
- (void)buildContact;

@end

