//
//  ViewController.m
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *textlabel;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.textlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 50)];
    [self.textlabel setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"Text"]];
    [self.view addSubview:self.textlabel];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, 300, 50)];
    [self.textField setPlaceholder:@"Enter text"];
    [self.textField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.textField];
    
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 250, 150, 50)];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    UIButton *removeButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 250, 150, 50)];
    [removeButton setTitle:@"Remove" forState:UIControlStateNormal];
    [removeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeButton];
}

- (void)saveButtonTap {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *text = [self.textField text];
    [defaults setObject:text forKey:@"Text"];
    
    [self.textlabel setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"Text"]];
}

- (void)removeButtonTap {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"Text"];
    
    [self.textlabel setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"Text"]];
}

@end
