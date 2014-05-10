//
//  SQNAddEntryViewController.h
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNCameraViewController.h"

@class Sequence;

@interface SQNAddEntryViewController : SQNCameraViewController

- (instancetype)initWithSequence:(Sequence *)sequence;

@end
