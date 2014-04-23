#import "SequenceEntry.h"


@interface SequenceEntry ()

// Private interface goes here.

@end


@implementation SequenceEntry

+ (NSString *)primaryKey {
    
    return @"entryId";
}

+ (instancetype)insertInCurrentContext {
    
    SequenceEntry *entry = [super insertInCurrentContext];
    
    entry.createdDate = [NSDate date];
    
    return entry;
}

@end
