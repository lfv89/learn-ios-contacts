//
//  ContactsListViewController.m
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/18/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import "ContactsListViewController.h"

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
    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"This is an alert" message:@"Showing the contact form..." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction =
        [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) { NSLog(@"OK was clicked!"); }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
