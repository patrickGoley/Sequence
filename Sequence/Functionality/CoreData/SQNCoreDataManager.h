//
//  SQNCoreDataManager.h
//  Sequence
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSManagedObject+Additions.h"

@interface SQNCoreDataManager : NSObject

+ (NSManagedObjectContext *)currentContext;

@end
