//
//  SQNSequenceSettingsViewController.m
//  Sequence
//
//  Created by Patrick Goley on 5/9/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNSequenceSettingsViewController.h"
#import "Sequence.h"

@interface SQNSequenceSettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *reminderDateLabel;
@property (weak, nonatomic) IBOutlet UISlider *holdCaptureSlider;
@property (weak, nonatomic) IBOutlet UITextField *photosAgoField;
@property (weak, nonatomic) IBOutlet UISlider *overlayOpacitySlider;
@property (nonatomic, strong) Sequence *sequence;

@end

@implementation SQNSequenceSettingsViewController

- (instancetype)initWithSequence:(Sequence *)sequence {
    
    self = [super init];
    if (self) {
        
        _sequence = sequence;
    }
    
    return self;
}

@end
