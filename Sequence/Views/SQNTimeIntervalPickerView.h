//
//  SQNTimeIntervalPickerView.h
//  Sequence
//
//  Created by Patrick Goley on 5/10/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SQNTimeIntervalPickerView : UIView

- (RACSignal *)intervalChangedSignal;

- (RACSignal *)unitsChangedSignal;

@end
