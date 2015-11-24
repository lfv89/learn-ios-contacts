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
        self.dao = [ContactDAO getInstance];
        
        self.navigationItem.title = @"Contacts";
        
        UIBarButtonItem *showFormButton =
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showContactForm)];
        self.navigationItem.rightBarButtonItem = showFormButton;
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

// Esse método garante que os contatos serão exibidos
// após terem sido adicioandos. Sem ele, a tableView
// nunca é recarregada, e nada aparece.

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
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
    
    if (self.selected) {
        form.contact = self.selected;
    }
    
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

// Esse método diz para a tableView quantas seções a lista
// vai ter. OBS: Por padrão ele já retorna 1, aqui ele foi
// sobrescrito mais por questão de clareza. Ele não
// precisava ter sido sobrescrito.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Esse método diz para a tableView quantas linhas a lista
// vai ter. Esse método precisa obrigatoriamente ser
// sobrescrito.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao.contacts count];
}

// Esse método diz para a tableView como cada célula de cada
// linha vai ser configurada. É nele efetivamente que se diz
// qual será o contéudo e o formato de cada linha.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    Contact *contact = [self.dao getContactAtPosition:indexPath.row];
    cell.textLabel.text = contact.name;
    
    return cell;
}

// Esse método é chamado assim que, após apertar no botão "Edit"
// da lista, o usuário clica no "Delete" de um dos itens
// da lista.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao removeContactAtPosition:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selected = [self.dao getContactAtPosition:indexPath.row];
    [self showContactForm];
}

@end