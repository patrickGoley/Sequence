//
//  SQNImageCache.m
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNImageCache.h"
#import <FastImageCache/FICImageCache.h>

@implementation SQNImageCache

+ (instancetype)sharedCache {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        
    }
    
    return self;
}

- (void)initializeFastImageCache {
    
    
}

@end
