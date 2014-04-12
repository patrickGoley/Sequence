//
//  NSManagedObject+Additions.h
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Additions)

+ (NSString *)primaryKey;

+ (NSString *)entityName;

+ (instancetype)insertInCurrentContext;

- (void)deleteFromCurrentContext;

@end
