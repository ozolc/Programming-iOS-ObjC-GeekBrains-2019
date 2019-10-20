//
//  ViewController.m
//  Lesson01
//
//  Created by Maksim Nosov on 20/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIProgressView *progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //UIImageView ====================
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 370, 150, 150)];
    [imgView setBackgroundColor:[UIColor greenColor]];
    [imgView setImage:[UIImage imageNamed:@"cat"]];
    [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imgView];

    //UIButton ====================
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 30)];
    [button setTitle:@"Press me." forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    // UILabel ====================
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, [self.view bounds].size.width - 20, 50)];
    [self.label setText:@"Hello world."];
    [self.label setTextColor:[UIColor blueColor]];
    [self.label setBackgroundColor:[UIColor greenColor]];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label setFont:[UIFont systemFontOfSize:30 weight:UIFontWeightBold]];
    [self.view addSubview:self.label];
    
    
    // UITextField ====================
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, [self.view bounds].size.width - 20, 50)];
    [self.textField setBorderStyle:(UITextBorderStyleLine)];
    [self.textField setPlaceholder:@"Введите текст"];
    [self.view addSubview:self.textField];
    
    // UITextView ====================
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 300, [self.view bounds].size.width - 20, 50)];
//    [textView setBackgroundColor:[UIColor lightGrayColor]];
//    [self.view addSubview:textView];
    
    // UIActivityIndicatorView ====================
//    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] init];
//    [indicator setFrame:CGRectMake(10, 300, 200, 50)];
//    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
//    [indicator setHidesWhenStopped:true];
//    [indicator startAnimating];
//    [self.view addSubview:indicator];
                                  
    // UIProgressView ====================
//    self.progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//    [self.progress setTintColor:[UIColor redColor]];
//    [self.progress setFrame:CGRectMake(10, 370, 200, 50)];
//    [self.progress setProgress:0.5];
//    [self.view addSubview:self.progress];
    
    
    // UISlider ====================
//    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 300, 200, 50)];
//    [slider setTintColor:[UIColor greenColor]];
//    [slider setValue:0.5];
//    [slider addTarget:self action:@selector(changeSliderValue:) forControlEvents:(UIControlEventValueChanged)];
//    [self.view addSubview:slider];
    
    // UISegmentedControl ====================
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Первый", @"Второй"]];
//    [segmentedControl setFrame:CGRectMake(10, 300, 200, 50)];
//    [segmentedControl setTintColor:[UIColor blueColor]];
//    [segmentedControl setSelectedSegmentIndex:0];
//    [segmentedControl addTarget:self action:@selector(changeSegment:) forControlEvents:(UIControlEventValueChanged)];
//    [self.view addSubview:segmentedControl];
    
    // UIView ====================
//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [myView setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:myView];
//
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
//    [redView setBackgroundColor:[UIColor redColor]];
//    [myView addSubview:redView];
}

- (void)buttonPressed {
    [self.label setBackgroundColor:[UIColor magentaColor]];
    [self.label setText:[self.textField text]];
}

-(void)changeSegment:(UISegmentedControl*)sender {
    NSLog(@"Выбран сегмент номер %li", [sender selectedSegmentIndex]);
}

-(void)changeSliderValue: (UISlider*)sender {
    [self.label setText:[NSString stringWithFormat:@"%f", sender.value]];
    [self.progress setProgress:sender.value];
}


@end
