//
//  NSParagraphStyle+Additions.h
//  fa-coreproject-4.0
//
//  Created by Pat Goley on 11/12/13.
//  Copyright (c) 2013 Aloompa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableParagraphStyle (Additions)

+ (NSMutableParagraphStyle *)styleWithAlignment:(NSTextAlignment)alignment;

+ (NSMutableParagraphStyle *)styleWithAlignment:(NSTextAlignment)alignment lineHeightMultiple:(CGFloat)lineHeightMultiple;

@end
