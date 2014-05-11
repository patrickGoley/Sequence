#import "_Sequence.h"
#import "NSManagedObject+Additions.h"

@interface Sequence : _Sequence {}

@property (nonatomic, readonly) NSArray *sortedImageURLs;

+ (NSArray *)allSequences;

- (NSURL *)addSequenceEntryWithImage:(UIImage *)image;

- (UIImage *)previewOverlayImage;

@end
