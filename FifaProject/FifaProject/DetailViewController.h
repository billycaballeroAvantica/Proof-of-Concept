//
//  DetailViewController.h
//  PoC
//
//  Created by Alex Gutierrez on 7/16/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
