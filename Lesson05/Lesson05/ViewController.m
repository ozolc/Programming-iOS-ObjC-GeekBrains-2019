//
//  ViewController.m
//  Lesson05
//
//  Created by Maksim Nosov on 24/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.imageView setBackgroundColor:[UIColor lightTextColor]];
    [self.view addSubview:self.imageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 500)];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(imagePickerButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)imagePickerButtonTap {
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickerVC animated:true completion:nil];
    [pickerVC setDelegate:self];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    if (image) {
        [self.imageView setImage:image];
        [picker dismissViewControllerAnimated:true completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
