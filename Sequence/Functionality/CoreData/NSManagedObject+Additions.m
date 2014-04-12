//
//  NSManagedObject+Additions.m
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "NSManagedObject+Additions.h"
#import "SQNCoreDataManager.h"
#import <CoreData/CoreData.h>

@implementation NSManagedObject (Additions)

+ (NSString *)primaryKey {
    
    return @"";
}

+ (NSString *)entityName {
    
    return NSStringFromClass(self);
}

+ (instancetype)insertInCurrentContext {
    
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:[SQNCoreDataManager currentContext]];
    
    NSNumber *newPrimaryKeyValue = [self nextAvailablePrimaryKeyValue];
    
    [managedObject setValue:newPrimaryKeyValue forKey:[self primaryKey]];
    
    return managedObject;
}

+ (NSNumber *)nextAvailablePrimaryKeyValue {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:[self primaryKey] ascending:YES]];
    
    NSManagedObject *maxIdRecord = [[[SQNCoreDataManager currentContext] executeFetchRequest:fetchRequest error:nil] lastObject];
    
    if (!maxIdRecord) {
        
        return @0;
        
    } else {
        
        NSNumber *currentMaxId = [maxIdRecord valueForKey:[self primaryKey]];
        
        return @(currentMaxId.integerValue + 1);
    }
}

- (void)deleteFromCurrentContext {
    
    [[SQNCoreDataManager currentContext] deleteObject:self];
}

@end
