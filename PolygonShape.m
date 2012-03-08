//
//  PolygonShape.m
//  Assignment 2
//
//  Created by NIMESH DESAI on 9/20/09.
//  Copyright 2009 Nimesh Desai. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape
	
@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

	
-(void) setNumberOfSides:(int)value
{
	if(value < self.minimumNumberOfSides)
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", value, self.minimumNumberOfSides);
	else 
		if(value > self.maximumNumberOfSides)
			NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", value, self.maximumNumberOfSides);
	else
		numberOfSides = value;
}

-(void) setMinimumNumberOfSides:(int)value
{
	if(value < 3)
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", value, 3);
	else
		minimumNumberOfSides = value;
}

-(void) setMaximumNumberOfSides:(int)value
{
	if(value > 12)
		NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", value, 12);
	else
		maximumNumberOfSides = value;
}

- (float) angleInDegrees
{
	return (180.0*(self.numberOfSides-2)/self.numberOfSides);
}

- (float) angleInRadians
{
	return (self.angleInDegrees * M_PI)/180;
}

- (NSString *) name 
{
	NSArray* names = [NSArray arrayWithObjects:@"Triangle", @"Square", @"Pentagon", @"Hexagon",@"Heptagon",@"Octagon",
											   @"Nonagon",@"Decagon",@"Hendecagon", @"Dodecagon",nil];
	
	return self.numberOfSides < 3 ? @"Either a line or a point" : [names objectAtIndex: self.numberOfSides - 3];
}

- (NSString *) description
{
	return [NSString stringWithFormat: @"Hello I am a %d-sided polygon (aka a %@) with angles of %.0f degrees (%f radians)", 
			self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

- (id)init 
{
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:12];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max 
{
	// allow superclass to initialize its state first 
	if (self = [super init]) 
	{
		self.maximumNumberOfSides = max;
		self.minimumNumberOfSides = min;
		self.numberOfSides		  = sides;
	} 
	return self;
}

-(void) dealloc 
{
	NSLog(@"Calling dealloc");
	[super dealloc];
}

@end
