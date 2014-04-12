#import "_Sequence.h"
#import "NSManagedObject+Additions.h"

@interface Sequence : _Sequence {}

+ (NSArray *)allSequences;

- (NSArray *)sortedSequenceImageURLs;

- (NSURL *)addSequenceEntryWithImage:(UIImage *)image;

@end
