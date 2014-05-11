//
//  SQNViewModel.m
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNViewModel.h"

@implementation SQNViewModel

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
        
        _model = model;
    }
    
    return self;
}

@end
