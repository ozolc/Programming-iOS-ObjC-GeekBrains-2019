//
//  NetworkService.m
//  Lesson03
//
//  Created by Maksim Nosov on 22/10/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "NetworkService.h"
#import "RateModel.h"

#define MAIN_URL @"https://api.exchangeratesapi.io/latest?base=RUB"

@implementation NetworkService

+ (instancetype)sharedInstance {
    static NetworkService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkService alloc] init];
    });
    return instance;
}

- (void)getAllRates:(void (^)(NSArray *rates))completion {
    [self load:MAIN_URL withCompletion:^(id  _Nullable result) {
        NSDictionary *dict = result;
        NSMutableArray *resultObjects = [NSMutableArray new];
        [dict[@"rates"] enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL * _Nonnull stop) {
            NSDictionary *rate = @{@"rateName": key, @"rateValue": obj};
            RateModel *model = [[RateModel alloc] initFromDictionary:rate];
            [resultObjects addObject:model];
        }];
        completion(resultObjects);
    }];
}

- (void)load:(NSString*)address withCompletion:(void (^)(id _Nullable result))completion {
    [[[NSURLSession sharedSession ] dataTaskWithURL:[NSURL URLWithString:address]
                                  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil]);
    }] resume];
}

@end
