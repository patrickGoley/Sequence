//
//  SQNTimeIntervalPickerView.m
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNTimeIntervalPickerView.h"
#import "SQNSequenceEditViewModel.h"

@interface SQNTimeIntervalPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic) NSNumber *selectedCount;
@property (nonatomic) NSString *selectedUnits;
@property (nonatomic, strong) NSArray *units;

@end

@implementation SQNTimeIntervalPickerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        [self addSubview:_pickerView];
        
        _units = @[@"Minutes", @"Days", @"Hours", @"Weeks"];
        
        [_pickerView reloadAllComponents];
    }
    return self;
}

#pragma mark - RAC Signals

- (RACSignal *)intervalChangedSignal {
    
    return RACObserve(self, selectedCount);
}

- (RACSignal *)unitsChangedSignal {
    
    return RACObserve(self, selectedUnits);
}

#pragma mark - UIPickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return 60;
        
    } else {
        
        return self.units.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        
        return [NSString stringWithFormat:@"%@", @(row + 1)];
        
    } else {
        
        return self.units[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        
        self.selectedCount = @(row + 1);
        
    } else {
        
        self.selectedUnits = self.units[row];
    }
}

@end
