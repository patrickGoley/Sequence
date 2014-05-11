// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sequence.m instead.

#import "_Sequence.h"

const struct SequenceAttributes SequenceAttributes = {
	.createdDate = @"createdDate",
	.displayName = @"displayName",
	.holdCaptureInterval = @"holdCaptureInterval",
	.overlayImageOffset = @"overlayImageOffset",
	.overlayOpacity = @"overlayOpacity",
	.reminderInterval = @"reminderInterval",
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
	
	if ([key isEqualToString:@"holdCaptureIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"holdCaptureInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"overlayImageOffsetValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"overlayImageOffset"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"overlayOpacityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"overlayOpacity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"reminderIntervalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"reminderInterval"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"sequenceIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sequenceId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdDate;






@dynamic displayName;






@dynamic holdCaptureInterval;



- (double)holdCaptureIntervalValue {
	NSNumber *result = [self holdCaptureInterval];
	return [result doubleValue];
}

- (void)setHoldCaptureIntervalValue:(double)value_ {
	[self setHoldCaptureInterval:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveHoldCaptureIntervalValue {
	NSNumber *result = [self primitiveHoldCaptureInterval];
	return [result doubleValue];
}

- (void)setPrimitiveHoldCaptureIntervalValue:(double)value_ {
	[self setPrimitiveHoldCaptureInterval:[NSNumber numberWithDouble:value_]];
}





@dynamic overlayImageOffset;



- (int32_t)overlayImageOffsetValue {
	NSNumber *result = [self overlayImageOffset];
	return [result intValue];
}

- (void)setOverlayImageOffsetValue:(int32_t)value_ {
	[self setOverlayImageOffset:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOverlayImageOffsetValue {
	NSNumber *result = [self primitiveOverlayImageOffset];
	return [result intValue];
}

- (void)setPrimitiveOverlayImageOffsetValue:(int32_t)value_ {
	[self setPrimitiveOverlayImageOffset:[NSNumber numberWithInt:value_]];
}





@dynamic overlayOpacity;



- (float)overlayOpacityValue {
	NSNumber *result = [self overlayOpacity];
	return [result floatValue];
}

- (void)setOverlayOpacityValue:(float)value_ {
	[self setOverlayOpacity:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveOverlayOpacityValue {
	NSNumber *result = [self primitiveOverlayOpacity];
	return [result floatValue];
}

- (void)setPrimitiveOverlayOpacityValue:(float)value_ {
	[self setPrimitiveOverlayOpacity:[NSNumber numberWithFloat:value_]];
}





@dynamic reminderInterval;



- (double)reminderIntervalValue {
	NSNumber *result = [self reminderInterval];
	return [result doubleValue];
}

- (void)setReminderIntervalValue:(double)value_ {
	[self setReminderInterval:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveReminderIntervalValue {
	NSNumber *result = [self primitiveReminderInterval];
	return [result doubleValue];
}

- (void)setPrimitiveReminderIntervalValue:(double)value_ {
	[self setPrimitiveReminderInterval:[NSNumber numberWithDouble:value_]];
}





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
