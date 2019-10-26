//
//  MakeHumanVC.m
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "MakeHumanVC.h"
#import "CoreDataService.h"

@interface MakeHumanVC ()

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *ageTextField;
@property (nonatomic, strong) UITextField *cityTextField;
@property (nonatomic, strong) UISwitch *sexSwitch;

@end

@implementation MakeHumanVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 150, 300, 50)];
    [self.nameTextField setPlaceholder:@"Enter name"];
    [self.nameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.nameTextField];
    
    self.ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 250, 300, 50)];
    [self.ageTextField setPlaceholder:@"Enter age"];
    [self.ageTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.ageTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.ageTextField];
    
    self.cityTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 350, 300, 50)];
    [self.cityTextField setPlaceholder:@"Enter city"];
    [self.cityTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.cityTextField];
    
    self.sexSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 450, 100, 50)];
    [self.view addSubview:self.sexSwitch];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle: @"Save"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(saveButtonTap)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    }

- (void)saveButtonTap {
    [[CoreDataService sharedInstance] createHumanWithName:self.nameTextField.text
                                                  withAge:[NSNumber numberWithInt:(int)self.ageTextField.text]
                                                 withCity:self.cityTextField.text
                                                  withSex:self.sexSwitch.isOn];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
