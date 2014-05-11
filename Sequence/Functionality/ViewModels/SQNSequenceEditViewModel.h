//
//  SQNSequenceEditViewModel.h
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

typedef NS_ENUM(NSUInteger, SQNIntervalUnit) {
    SQNIntervalUnit_Minute = 0,
    SQNIntervalUnit_Hour = 1,
    SQNIntervalUnit_Day = 2,
    SQNIntervalUnit_Week = 3
};

@class Sequence;

@interface SQNSequenceEditViewModel : SQNViewModel

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSNumber *reminderUnits;
@property (nonatomic, strong) NSNumber *reminderInterval;

@property (nonatomic, strong) NSNumber *captureIntervalPercentage;

@property (nonatomic, strong) NSNumber *overlayOffset;
@property (nonatomic, strong) NSNumber *overlayOpacity;


- (instancetype)initWithModel:(Sequence *)model;

- (void)saveChanges;

- (void)cancelChanges;


//Display change signals

- (RACSignal *)reminderTextSignal;

- (RACSignal *)captureIntervalTextSignal;

- (RACSignal *)opacityTextSignal;


@end
