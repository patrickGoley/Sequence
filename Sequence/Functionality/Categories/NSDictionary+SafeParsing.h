//
//  NSDictionary+SafeParsing.h
//  instagram POC
//
//  Created by andrew lattis on 13/4/16.
//  Copyright (c) 2013 Andrew Lattis. All rights reserved.
//

#import <Foundation/Foundation.h>

///category that returns a value from a json array, or nil if the value is null
@interface NSDictionary (SafeParsing)

/**
 * returns the object at a given key, or nil
 * @param key the key to the value to be returned
 * @return the value associated with the key, or nil. never null
 */
- (id)safeObjectForKey:(id<NSCopying>)key;

- (NSString *)safeStringForKey:(id<NSCopying>)key;

- (NSNumber *)safeNumberForKey:(id<NSCopying>)key;

@end

@interface NSMutableDictionary (SafeParsing)

- (void)safeSetObject:(id)object forKey:(id<NSCopying>)key;

@end

