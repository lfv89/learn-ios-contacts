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

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)getFormData {
    Contact *contact = [[Contact alloc] init];
    
    contact.name    = [self.name    text];
    contact.phone   = [self.phone   text];
    contact.email   = [self.email   text];
    contact.address = [self.address text];
    contact.site    = [self.site    text];
    
    NSLog(@"Contact information: %@", contact);
}

@end
