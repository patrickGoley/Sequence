//
//  SQNViewController.m
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNViewController.h"

@interface SQNViewController ()

@end

@implementation SQNViewController

- (instancetype)init {
    
    self = [self initWithNib];
    if (self) {
        
        
    }
    
    return self;
}

- (instancetype)initWithNib {
    
    self = [super initWithNibName:[self nibName] bundle:[NSBundle mainBundle]];
    if (self) {
        
        
    }
    
    return self;
}

+ (NSString *)nibName {
    
    return NSStringFromClass(self);
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	
}

- (void)dismiss {
    
    if (self.navigationController.viewControllers.count > 1 && self.navigationController.visibleViewController == self) {
        
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    NSLog(@"%@ %@", NSStringFromClass([self  class]), NSStringFromSelector(_cmd));
}

@end
