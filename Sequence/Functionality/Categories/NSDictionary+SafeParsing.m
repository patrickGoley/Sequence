//
//  NSDictionary+Socialize.m
//  instagram POC
//
//  Created by andrew lattis on 13/4/16.
//  Copyright (c) 2013 Andrew Lattis. All rights reserved.
//

#import "NSDictionary+SafeParsing.h"

@implementation NSDictionary (SafeParsing)


- (id)safeObjectForKey:(id<NSCopying>)key {
	id value = [self objectForKey:key];
	if (value == [NSNull null]) {
		return nil;
	}
	return value;
}

- (NSString *)safeStringForKey:(id<NSCopying>)key {
    
    id value = [self safeObjectForKey:key];
    
    if (![value isKindOfClass:[NSString class]]) {
        
        return nil;
    }
    
    return value;
}

- (NSNumber *)safeNumberForKey:(id<NSCopying>)key {
    
    id value = [self safeObjectForKey:key];
    
    if (![value isKindOfClass:[NSNumber class]]) {
        
        return nil;
    }
    
    return value;
}

@end

@implementation NSMutableDictionary (SafeParsing)

- (void)safeSetObject:(id)object forKey:(id<NSCopying>)key {
    
    if (object && key) {
        
        [self setObject:object forKey:key];
    }
}

@end
