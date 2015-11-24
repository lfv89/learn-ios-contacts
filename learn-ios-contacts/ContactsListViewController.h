//
//  ContactsListViewController.h
//  learn-ios-contacts
//
//  Created by Luis Vasconcellos on 11/18/15.
//  Copyright (c) 2015 Luis Vasconcellos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactDAO.h"

@interface ContactsListViewController : UITableViewController

@property ContactDAO *dao;
@property Contact *selected;

@end
