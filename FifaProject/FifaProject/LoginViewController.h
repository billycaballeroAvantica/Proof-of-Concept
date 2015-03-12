//
//  LoginViewController.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/12/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username_textfield;
@property (weak, nonatomic) IBOutlet UITextField *password_textfield;
- (IBAction)goSignIn:(id)sender;

@property UITapGestureRecognizer * tapRecognizer;
@property UITextField *activeTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *login_bottom_contraint;
@property CGSize keyboardSize;
@property (weak, nonatomic) IBOutlet UIButton *btn_login;

@end
