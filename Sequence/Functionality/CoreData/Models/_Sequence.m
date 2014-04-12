// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sequence.m instead.

#import "_Sequence.h"

const struct SequenceAttributes SequenceAttributes = {
	.createdDate = @"createdDate",
	.displayName = @"displayName",
	.sequenceId = @"sequenceId",
	.userDescription = @"userDescription",
};

const struct SequenceRelationships SequenceRelationships = {
	.entries = @"entries",
};

const struct SequenceFetchedProperties SequenceFetchedProperties = {
};

@implementation SequenceID
@end

@implementation _Sequence

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sequence" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sequence";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sequence" inManagedObjectContext:moc_];
}

- (SequenceID*)objectID {
	return (SequenceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"sequenceIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sequenceId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdDate;






@dynamic displayName;






@dynamic sequenceId;



- (int32_t)sequenceIdValue {
	NSNumber *result = [self sequenceId];
	return [result intValue];
}

- (void)setSequenceIdValue:(int32_t)value_ {
	[self setSequenceId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSequenceIdValue {
	NSNumber *result = [self primitiveSequenceId];
	return [result intValue];
}

- (void)setPrimitiveSequenceIdValue:(int32_t)value_ {
	[self setPrimitiveSequenceId:[NSNumber numberWithInt:value_]];
}





@dynamic userDescription;






@dynamic entries;

	
- (NSMutableSet*)entriesSet {
	[self willAccessValueForKey:@"entries"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"entries"];
  
	[self didAccessValueForKey:@"entries"];
	return result;
}
	






@end
