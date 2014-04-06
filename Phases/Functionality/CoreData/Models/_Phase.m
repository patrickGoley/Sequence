// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Phase.m instead.

#import "_Phase.h"

const struct PhaseAttributes PhaseAttributes = {
	.createdDate = @"createdDate",
	.displayName = @"displayName",
	.phaseId = @"phaseId",
	.userDescription = @"userDescription",
};

const struct PhaseRelationships PhaseRelationships = {
	.entries = @"entries",
};

const struct PhaseFetchedProperties PhaseFetchedProperties = {
};

@implementation PhaseID
@end

@implementation _Phase

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Phase" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Phase";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Phase" inManagedObjectContext:moc_];
}

- (PhaseID*)objectID {
	return (PhaseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"phaseIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"phaseId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdDate;






@dynamic displayName;






@dynamic phaseId;



- (int32_t)phaseIdValue {
	NSNumber *result = [self phaseId];
	return [result intValue];
}

- (void)setPhaseIdValue:(int32_t)value_ {
	[self setPhaseId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePhaseIdValue {
	NSNumber *result = [self primitivePhaseId];
	return [result intValue];
}

- (void)setPrimitivePhaseIdValue:(int32_t)value_ {
	[self setPrimitivePhaseId:[NSNumber numberWithInt:value_]];
}





@dynamic userDescription;






@dynamic entries;

	






@end
