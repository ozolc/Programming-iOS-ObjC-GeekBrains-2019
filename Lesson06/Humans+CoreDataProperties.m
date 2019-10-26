//
//  Humans+CoreDataProperties.m
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//
//

#import "Humans+CoreDataProperties.h"

@implementation Humans (CoreDataProperties)

+ (NSFetchRequest<Humans *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Humans"];
}

@dynamic age;
@dynamic city;
@dynamic sex;
@dynamic name;

@end
