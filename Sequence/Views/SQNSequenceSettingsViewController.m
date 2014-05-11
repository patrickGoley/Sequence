    //
//  SQNSequenceSettingsViewController.m
//  Sequence
//
//  Created by Patrick Goley on 5/9/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNSequenceSettingsViewController.h"
#import "Sequence.h"
#import "SQNCoreDataManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SQNSequenceEditViewModel.h"
#import "SQNTimeIntervalPickerView.h"
#import "UISlider+RACSignal.h"
#import <ReactiveCocoa/RACEXTScope.h>

@interface SQNSequenceSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *reminderDateLabel;
@property (weak, nonatomic) IBOutlet UISlider *holdCaptureSlider;
@property (weak, nonatomic) IBOutlet UILabel *captureLabel;
@property (weak, nonatomic) IBOutlet UITextField *photosAgoField;
@property (weak, nonatomic) IBOutlet UISlider *overlayOpacitySlider;
@property (weak, nonatomic) IBOutlet UILabel *opacityLabel;

@property (nonatomic, strong) SQNTimeIntervalPickerView *reminderPickerView;

@property (nonatomic, strong) SQNSequenceEditViewModel *viewModel;

@end

static CGFloat pickerHeight = 200;

@implementation SQNSequenceSettingsViewController

- (instancetype)initWithSequence:(Sequence *)sequence {
    
    self = [super init];
    if (self) {
        
        _viewModel = [[SQNSequenceEditViewModel alloc] initWithModel:sequence];
    }
    
    return self;
}

- (void)viewDidLoad {
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    
    //setup initial values
    
    self.nameField.text = self.viewModel.name;
    
    self.holdCaptureSlider.value = self.viewModel.captureIntervalPercentage.floatValue;
    
    self.photosAgoField.text = [NSString stringWithFormat:@"%@", self.viewModel.overlayOffset];
    
    self.overlayOpacitySlider.value = self.viewModel.overlayOpacity.floatValue;
    
//    self.reminderPickerView = [[SQNTimeIntervalPickerView alloc] initWithFrame:CGRectMake(0, self.view.height - pickerHeight, self.view.height, pickerHeight)];
//    [self.view addSubview:self.reminderPickerView];
    
    
    [self setupReactions];
}

- (void)toggleReminderPickerView:(BOOL)visible animated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGAffineTransform transform;
            
            if (visible) {
                
                transform = CGAffineTransformIdentity;
                
            } else {
                
                transform = CGAffineTransformMakeTranslation(0, pickerHeight);
            }
            
            self.reminderPickerView.transform = transform;
        }];
        
    } else {
            
        self.reminderPickerView.top = visible ? self.view.height - pickerHeight : self.view.height;
    }
}

- (void)setupReactions {
    
    //update view model values from UI
    
    RAC(self.viewModel, name) = self.nameField.rac_textSignal;
    
    RAC(self.viewModel, reminderUnits) = self.reminderPickerView.unitsChangedSignal;
    
    RAC(self.viewModel, reminderInterval) = self.reminderPickerView.intervalChangedSignal;
    
    RAC(self.viewModel, overlayOffset) = [self.photosAgoField.rac_textSignal map:^id(NSString *text) {
        
        return @(text.integerValue);
    }];
    
    //sliders
    
    RAC(self.viewModel, captureIntervalPercentage) = [self.holdCaptureSlider rac_valueChangedSignal];
    
    RAC(self.viewModel, overlayOpacity) = [self.overlayOpacitySlider rac_valueChangedSignal];
    
    
    //update UI with formatted text from view model
    
    RAC(self.reminderDateLabel, text) = self.viewModel.reminderTextSignal;
    
    RAC(self.captureLabel, text) = self.viewModel.captureIntervalTextSignal;
    
    RAC(self.opacityLabel, text) = self.viewModel.opacityTextSignal;
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return NO;
}

- (void)donePressed:(id)sender {
    
    [self.viewModel saveChanges];
    
    [self dismiss];
}

- (void)cancelPressed:(id)sender {
    
    [self.viewModel cancelChanges];
    
    [self dismiss];
}

@end
