// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sequence.h instead.

#import <CoreData/CoreData.h>


extern const struct SequenceAttributes {
	__unsafe_unretained NSString *createdDate;
	__unsafe_unretained NSString *displayName;
	__unsafe_unretained NSString *sequenceId;
	__unsafe_unretained NSString *userDescription;
} SequenceAttributes;

extern const struct SequenceRelationships {
	__unsafe_unretained NSString *entries;
} SequenceRelationships;

extern const struct SequenceFetchedProperties {
} SequenceFetchedProperties;

@class SequenceEntry;






@interface SequenceID : NSManagedObjectID {}
@end

@interface _Sequence : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SequenceID*)objectID;





@property (nonatomic, strong) NSDate* createdDate;



//- (BOOL)validateCreatedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* displayName;



//- (BOOL)validateDisplayName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sequenceId;



@property int32_t sequenceIdValue;
- (int32_t)sequenceIdValue;
- (void)setSequenceIdValue:(int32_t)value_;

//- (BOOL)validateSequenceId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userDescription;



//- (BOOL)validateUserDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *entries;

- (NSMutableSet*)entriesSet;





@end

@interface _Sequence (CoreDataGeneratedAccessors)

- (void)addEntries:(NSSet*)value_;
- (void)removeEntries:(NSSet*)value_;
- (void)addEntriesObject:(SequenceEntry*)value_;
- (void)removeEntriesObject:(SequenceEntry*)value_;

@end

@interface _Sequence (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedDate;
- (void)setPrimitiveCreatedDate:(NSDate*)value;




- (NSString*)primitiveDisplayName;
- (void)setPrimitiveDisplayName:(NSString*)value;




- (NSNumber*)primitiveSequenceId;
- (void)setPrimitiveSequenceId:(NSNumber*)value;

- (int32_t)primitiveSequenceIdValue;
- (void)setPrimitiveSequenceIdValue:(int32_t)value_;




- (NSString*)primitiveUserDescription;
- (void)setPrimitiveUserDescription:(NSString*)value;





- (NSMutableSet*)primitiveEntries;
- (void)setPrimitiveEntries:(NSMutableSet*)value;


@end
