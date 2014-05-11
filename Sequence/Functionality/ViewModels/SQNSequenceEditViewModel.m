//
//  SQNSequenceEditViewModel.m
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNSequenceEditViewModel.h"
#import "Sequence.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

static NSString *const minuteString = @"Minute";
static NSString *const hourString = @"Hour";
static NSString *const dayString = @"Day";
static NSString *const weekString = @"Week";

@interface SQNSequenceEditViewModel ()

@property (nonatomic, readonly) Sequence *model;

@end

@implementation SQNSequenceEditViewModel

- (instancetype)initWithModel:(Sequence *)model {
    
    self = [super initWithModel:model];
    if (self) {
        
        _name = model.displayName;
        
        _captureIntervalPercentage = @(model.holdCaptureInterval.floatValue / 10.0f);
        _overlayOffset = model.overlayImageOffset;
        _overlayOpacity = model.overlayOpacity;
        
        [self setupReactions];
    }
    
    return self;
}

- (void)setupReactions {
    
    //name
    
    RAC(self.model, displayName) = [RACObserve(self, name) map:^id(id value) {
        return value;
    }];

    
    //reminder
    
    RACSignal *reminderCountSignal = RACObserve(self, reminderInterval);
    
    RACSignal *reminderUnitsSignal = RACObserve(self, reminderInterval);
    
    RAC(self.model, reminderInterval) = [RACSignal combineLatest:@[reminderCountSignal, reminderUnitsSignal]
                                                          reduce:^(NSNumber *count, NSNumber *unit) {
                                                              
                                                              SQNIntervalUnit unitType = (SQNIntervalUnit)unit.unsignedIntegerValue;
                                                              
                                                              NSUInteger multiplier = [SQNSequenceEditViewModel multiplierForIntervalUnit:unitType];
                                                              
                                                              return @(count.integerValue * multiplier);
                                                          }];
    
    
    //capture interval
    
    RACSignal *captureIntervalSignal = RACObserve(self, captureIntervalPercentage);
    
    RAC(self.model, holdCaptureInterval) = [captureIntervalSignal map:^id(NSNumber *percentage) {
        
        return @(10.0f * percentage.floatValue);
    }];
    
    
    //image overlay settings
    
    RAC(self.model, overlayOpacity) = RACObserve(self, overlayOpacity);
    
    RAC(self.model, overlayImageOffset) = RACObserve(self, overlayOffset);
}

- (RACSignal *)reminderTextSignal {
    
    RACSignal *reminderCountSignal = RACObserve(self, reminderInterval);
    
    RACSignal *reminderUnitsSignal = RACObserve(self, reminderUnits);
    
    return [RACSignal combineLatest:@[reminderCountSignal, reminderUnitsSignal] reduce:^(NSNumber *count, NSNumber *unit) {
        
        NSString *unitString = [SQNSequenceEditViewModel stringFromIntervalUnit:(SQNIntervalUnit)unit.unsignedIntegerValue];
        
        if (count.integerValue != 1) {
            
            unitString = [unitString stringByAppendingString:@"s"];
        }
        
        return [NSString stringWithFormat:@"%@ %@", count, unitString];
    }];
}

- (RACSignal *)captureIntervalTextSignal {
    
    RACSignal *captureIntervalSignal = RACObserve(self.model, holdCaptureInterval);
    
    return [captureIntervalSignal map:^id(NSNumber *value) {
        
        return [NSString stringWithFormat:@"%@s", @(value.integerValue)];
    }];
}

- (RACSignal *)opacityTextSignal {
    
    RACSignal *opacitySignal = RACObserve(self.model, overlayOpacity);
    
    return [opacitySignal map:^id(NSNumber *value) {
        
        NSInteger integerValue = value.floatValue * 100;
        
        return [NSString stringWithFormat:@"%@%%", @(integerValue)];
    }];
}

#pragma mark - Unit Helper Methods

+ (NSString *)stringFromIntervalUnit:(SQNIntervalUnit)unit {
    
    switch (unit) {
            
        case SQNIntervalUnit_Minute: {
            
            return minuteString;
        } break;
            
        case SQNIntervalUnit_Hour: {
            
            return hourString;
        } break;
            
        case SQNIntervalUnit_Day: {
            
            return dayString;
        } break;
            
        case SQNIntervalUnit_Week: {
            
            return weekString;
        } break;
            
        default:
            break;
    }
}

+ (SQNIntervalUnit)intervalUnitForString:(NSString *)unitString {
    
    if ([unitString isEqualToString:minuteString]) {
        
        return SQNIntervalUnit_Minute;
        
    } else if ([unitString isEqualToString:hourString]) {
        
        return SQNIntervalUnit_Hour;
        
    } else if ([unitString isEqualToString:dayString]) {
        
        return SQNIntervalUnit_Day;
        
    } else {
        
        return SQNIntervalUnit_Week;
    }
}

+ (NSUInteger)multiplierForIntervalUnit:(SQNIntervalUnit)unit {
    
    switch (unit) {
        case SQNIntervalUnit_Minute: {
            
            return 60;
        } break;
            
        case SQNIntervalUnit_Hour: {
            
            return 3600;
        } break;
            
        case SQNIntervalUnit_Day: {
            
            return 3600 * 24;
        } break;
            
        case SQNIntervalUnit_Week: {
            
            return 3600 * 24 * 7;
        } break;
            
        default:
            break;
    }
}

- (void)saveChanges {
    
    NSError *error;
    
    [self.model.managedObjectContext save:&error];
    
    if (error) {
        
        NSLog(@"Error saving Sequnce record: %@", error);
    }
}

- (void)cancelChanges {
    
    [self.model.managedObjectContext reset];
}

@end
