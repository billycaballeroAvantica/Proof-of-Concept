//
//  LoginViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/12/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "LoginViewController.h"
#import "WelcomeViewController.h"

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNotifications];
    [self setTapRecognizer];
    [self setUpElements];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self setConstantContraints];
}

#pragma mark -
#pragma mark - Set Elements
#pragma mark -

-(void) setTapRecognizer
{
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(didTapAnywhere:)];
}

- (void) setConstantContraints {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat constantHeight = screenRect.size.height * 3.5/10  ;
    self.login_bottom_contraint.constant = constantHeight;
}

- (void) setUpElements {
    self.username_textfield.layer.borderColor = [UIColor whiteColor].CGColor;
    self.password_textfield.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btn_login.layer.borderColor = [UIColor whiteColor].CGColor;
}



#pragma mark - Set Notifications Observer

-(void) setNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [notificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
}

#pragma mark -
#pragma mark - Actions
#pragma mark -

- (IBAction)goSignIn:(id)sender
{
    [self logginCurrentUser];
}

-(void) keyboardWillShow:(NSNotification *) note
{
    self.keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    self.login_bottom_contraint.constant = self.keyboardSize.height;
    [self.view addGestureRecognizer: self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer: self.tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer
{
    [self.activeTextField resignFirstResponder];
    [self setConstantContraints];
}

- (void) logginCurrentUser {
    NSLog(@"Username = %@ , Password = %@", self.username_textfield.text, self.password_textfield.text);
    NSLog(@"preper to next page");
    [self performSegueWithIdentifier:@"goWelcomeViewController" sender:self];
}

#pragma mark -
#pragma mark - Delagates
#pragma mark -

#pragma mark - TextField Delegates

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.username_textfield) {
        [self.password_textfield becomeFirstResponder];
    } else if (textField == self.password_textfield) {
        [textField resignFirstResponder];
        [self logginCurrentUser];
    }
    return YES;
}

#pragma mark - Prepare Segue Delegate 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goWelcomeViewController"]){
        WelcomeViewController *welcomeController = [segue destinationViewController];
        welcomeController.name_current_user = self.username_textfield.text;
    }
}

@end
