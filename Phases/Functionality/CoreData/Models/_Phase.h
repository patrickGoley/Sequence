// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Phase.h instead.

#import <CoreData/CoreData.h>


extern const struct PhaseAttributes {
	__unsafe_unretained NSString *createdDate;
	__unsafe_unretained NSString *displayName;
	__unsafe_unretained NSString *phaseId;
	__unsafe_unretained NSString *userDescription;
} PhaseAttributes;

extern const struct PhaseRelationships {
	__unsafe_unretained NSString *entries;
} PhaseRelationships;

extern const struct PhaseFetchedProperties {
} PhaseFetchedProperties;

@class PhaseEntry;






@interface PhaseID : NSManagedObjectID {}
@end

@interface _Phase : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PhaseID*)objectID;





@property (nonatomic, strong) NSDate* createdDate;



//- (BOOL)validateCreatedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* displayName;



//- (BOOL)validateDisplayName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* phaseId;



@property int32_t phaseIdValue;
- (int32_t)phaseIdValue;
- (void)setPhaseIdValue:(int32_t)value_;

//- (BOOL)validatePhaseId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userDescription;



//- (BOOL)validateUserDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) PhaseEntry *entries;

//- (BOOL)validateEntries:(id*)value_ error:(NSError**)error_;





@end

@interface _Phase (CoreDataGeneratedAccessors)

@end

@interface _Phase (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedDate;
- (void)setPrimitiveCreatedDate:(NSDate*)value;




- (NSString*)primitiveDisplayName;
- (void)setPrimitiveDisplayName:(NSString*)value;




- (NSNumber*)primitivePhaseId;
- (void)setPrimitivePhaseId:(NSNumber*)value;

- (int32_t)primitivePhaseIdValue;
- (void)setPrimitivePhaseIdValue:(int32_t)value_;




- (NSString*)primitiveUserDescription;
- (void)setPrimitiveUserDescription:(NSString*)value;





- (PhaseEntry*)primitiveEntries;
- (void)setPrimitiveEntries:(PhaseEntry*)value;


@end
