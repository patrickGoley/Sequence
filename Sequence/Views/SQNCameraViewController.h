//
//  SQNCameraViewController.h
//  Sequence
//
//  Created by Pat Goley on 4/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNViewController.h"

@interface SQNCameraViewController : SQNViewController

- (void)captureStillImage;

- (void)imageCaptured:(UIImage *)image withMetadata:(NSDictionary *)metadata;

@end
