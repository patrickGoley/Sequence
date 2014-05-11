//
//  SQNViewModel.h
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQNViewModel : NSObject

@property (nonatomic, readonly) id model;

- (instancetype)initWithModel:(id)model;

@end
