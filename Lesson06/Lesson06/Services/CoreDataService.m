//
//  CoreDataService.m
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

#import "CoreDataService.h"
#import <CoreData/CoreData.h>

@interface CoreDataService ()

@property (nonatomic, strong) NSPersistentContainer *persistantContainer;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation CoreDataService

+ (instancetype)sharedInstance {
    static CoreDataService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataService alloc] init];
        [instance setup];
    });
    return instance;
}

- (void)setup {
    self.persistantContainer = [[NSPersistentContainer alloc] initWithName:@"Lesson6"];
    [self.persistantContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *desciption, NSError *error) {
        if (error != nil) {
            NSLog(@"Core data init error");
            abort();
        }
        self.context = self.persistantContainer.viewContext;
    }];
}

- (void)createHumanWithName:(NSString*)name
                            withAge:(NSNumber*)age
                            withCity:(NSString*)city
                            withSex:(BOOL)sex {
    Humans *newHuman = [NSEntityDescription insertNewObjectForEntityForName:@"Humans" inManagedObjectContext:self.context];
    [newHuman setValue:name forKey:@"name"];
    [newHuman setValue:age forKey:@"age"];
    [newHuman setValue:city forKey:@"city"];
    [newHuman setValue:[NSNumber numberWithBool:sex] forKey:@"sex"];
    [self save];
}

- (NSArray*)getAllHumans {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Humans"];
    NSError *error;
    
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    if (error && !request) {
        NSLog(@"Error fetching.");
    }
    
    return results;
}

- (void)save {
    NSError *error;
    if (![self.context save:&error]) {
        NSAssert(false, @"Error context save.");
    }
}

@end
