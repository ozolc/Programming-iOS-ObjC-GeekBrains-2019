//
//  HumanTableViewController.m
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "HumanTableViewController.h"
#import "MakeHumanVC.h"
#import "CoreDataService.h"

@interface HumanTableViewController ()

@property (nonatomic, strong) NSArray *humans;

@end

@implementation HumanTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle: @"Add"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addButtonTap)];
    [self.navigationItem setRightBarButtonItem:addButton];
    
    [self update];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(update) name:NSManagedObjectContextDidSaveNotification object:nil];
    
}

- (void)addButtonTap {
    NSLog(@"Add");
    MakeHumanVC *vc = [[MakeHumanVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)update {
    self.humans = [[CoreDataService sharedInstance] getAllHumans];
    [self.tableView reloadData];
}

#pragma mark - UITableVIewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.humans count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    Humans *human = [self.humans objectAtIndex:indexPath.row];
    [cell.textLabel setText:human.name];
    [cell.detailTextLabel setText:human.city];
    return cell;
}

@end
