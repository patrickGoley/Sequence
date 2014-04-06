//
//  NSManagedObject+Additions.m
//  Phases
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "NSManagedObject+Additions.h"
#import "PHSCoreDataManager.h"

@implementation NSManagedObject (Additions)

+ (NSString *)entityName {
    
    return NSStringFromClass(self);
}

+ (instancetype)insertInCurrentContext {
    
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:[PHSCoreDataManager currentContext]];
}

- (void)deleteFromCurrentContext {
    
    [[PHSCoreDataManager currentContext] deleteObject:self];
}

@end
