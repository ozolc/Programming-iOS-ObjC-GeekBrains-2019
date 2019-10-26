//
//  Humans+CoreDataProperties.h
//  Lesson06
//
//  Created by Maksim Nosov on 26.10.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//
//

#import "Humans+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Humans (CoreDataProperties)

+ (NSFetchRequest<Humans *> *)fetchRequest;

@property (nonatomic) int32_t age;
@property (nullable, nonatomic, copy) NSString *city;
@property (nonatomic) BOOL sex;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
