//
//  ViewController.m
//  Lesson02
//
//  Created by Maksim Nosov on 21/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"
#import "CatCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [NSMutableArray new];
    [self.items addObjectsFromArray:@[@"Cat", @"CatParty", @"SmileCat"]];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.tableView registerClass:[CatCell class] forCellReuseIdentifier:@"CatCell"];
    
    self.tableView.rowHeight = 80;
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    
    [self.tableView setTableFooterView:[UIView alloc]];
}

#pragma mark - UITableViewDataSource -

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 7;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *vv = [[UIView alloc] init];
//    [vv setBackgroundColor:[UIColor greenColor]];
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, tableView.bounds.size.width - 16, 50)];
//    [label setText:[self.items objectAtIndex:section]];
//    [vv addSubview:label];
//
//    return vv;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatCell"];
    [cell setupCellWithCatName:[self.items objectAtIndex:indexPath.row]];
    return cell;
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:@"Cell"];
    
//    if (indexPath.row % 2 == 0) {
//        cell.imageView.image = [UIImage imageNamed:@"cat"];
//        [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    } else {
//        cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
//        cell.detailTextLabel.text = @"Подзаголовок";
//    }
//    return cell;
}

#pragma mark = UITableViewDelegate -

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.items objectAtIndex:section];
//}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:false];
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

@end
