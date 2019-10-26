//
//  ViewController.m
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "ViewController.h"
#import "NetworkService.h"
#import "RateModel.h"
#import "DetailViewController.h"

@interface ViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *rates;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray *searchArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.obscuresBackgroundDuringPresentation = false;
    [self.searchController setSearchResultsUpdater:self];
    [self.navigationItem setSearchController:self.searchController];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTitle:@"Курсы валют"];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
    
    self.rates = [NSMutableArray new];
    
    [[NetworkService sharedInstance] getAllRates:^(NSArray *rates) {
        [self.rates addObjectsFromArray:rates];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - ResultsUpdater -

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (self.searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.rateName CONTAINS[cd]%@", searchController.searchBar.text];
        self.searchArray = [self.rates filteredArrayUsingPredicate:predicate];
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.isActive && [self.searchArray count] > 0) {
        return [self.searchArray count];
    }
    return [self.rates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    
    RateModel *model = nil;
    if (self.searchController.isActive && [self.searchArray count] > 0) {
        model = [self.searchArray objectAtIndex:indexPath.row];
    } else {
        model = [self.rates objectAtIndex:indexPath.row];
    }
    
    
    cell.textLabel.text = [model rateName];
    cell.detailTextLabel.text = [[model rateValue] stringValue];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RateModel *model = [self.rates objectAtIndex:indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc] initWithModel:model];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    [vc setModel:model];
//    [self.navigationController pushViewController:vc animated:true];
    [self presentViewController:nav animated:true completion:nil];
}

@end
