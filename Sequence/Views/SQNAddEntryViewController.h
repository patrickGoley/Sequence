//
//  SQNAddEntryViewController.h
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNCameraViewController.h"

@class SQNAddEntryViewController;

@protocol SQNAddEntryViewControllerDelegate <NSObject>

- (void)addEntryViewController:(SQNAddEntryViewController *)addEntryViewController didCaptureImage:(UIImage *)image;

@end

@interface SQNAddEntryViewController : SQNCameraViewController

@property (nonatomic, weak) id<SQNAddEntryViewControllerDelegate> delegate;

@end
