//
//  ContactDAO.h
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/12/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactDAO : NSObject

@property (strong, readonly) NSMutableArray *contacts;

+ (id)getInstance;
- (void)addContact:(Contact *)contact;
- (Contact *)getContactAtPosition:(NSInteger)position;

@end
