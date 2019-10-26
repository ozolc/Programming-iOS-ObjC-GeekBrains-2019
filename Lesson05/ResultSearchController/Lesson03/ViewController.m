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
#import "ResultSearchController.h"

@interface ViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *rates;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultSearchController *resultController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefinesPresentationContext:true];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTitle:@"Курсы валют"];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
    
    self.resultController = [[ResultSearchController alloc] init];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultController];
    [self.searchController setSearchResultsUpdater:self];
    [self.navigationItem setSearchController:self.searchController];
    
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
    if (searchController.searchBar.text) {
        NSMutableArray *resultArray = [NSMutableArray new];
        for (RateModel *model in self.rates) {
            if ([model.rateName.uppercaseString containsString:searchController.searchBar.text.uppercaseString]) {
                [resultArray addObject:model];
            }
        }
        self.resultController.results = resultArray;
        [self.resultController update];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    RateModel *model = [self.rates objectAtIndex:indexPath.row];
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
