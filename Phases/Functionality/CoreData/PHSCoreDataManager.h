//
//  PHSCoreDataManager.h
//  Phases
//
//  Created by Pat Goley on 4/6/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSManagedObject+Additions.h"

@interface PHSCoreDataManager : NSObject

+ (NSManagedObjectContext *)currentContext;

@end
