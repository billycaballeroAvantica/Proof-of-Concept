//
//  MasterViewController.h
//  PoC
//
//  Created by Alex Gutierrez on 7/16/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
