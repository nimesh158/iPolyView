//
//  PolygonShape.h
//  Assignment 2
//
//  Created by NIMESH DESAI on 9/20/09.
//  Copyright 2009 Nimesh Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

@property (assign) int numberOfSides;
@property (assign) int minimumNumberOfSides;
@property (assign) int maximumNumberOfSides;

@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString* name;

- (id)init;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
- (NSString *)description;
@end
