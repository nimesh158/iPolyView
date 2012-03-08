//
//  HelloPolyViewController.m
//  HelloPoly
//
//  Created by NIMESH DESAI on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (IBAction)changeLineStyle:(id)sender 
{	
	polygonView.lineStyle = [self selectedLineStyle];
}

- (int)selectedLineStyle
{	
	return [lineStyle selectedSegmentIndex];
}

- (void) awakeFromNib
{
	polygon.minimumNumberOfSides = 3;
	polygon.maximumNumberOfSides = 12;
	polygon.numberOfSides = [self defaultSides];
	[self updateInterface];
	NSLog(@"My polygon: %@", polygon);
}

- (IBAction)decrease:(id)sender
{
    NSLog(@"Decrease!");
	polygon.numberOfSides-=1;
	[self updateInterface];
}

- (IBAction)increase:(id)sender
{
    NSLog(@"Increase!");
	polygon.numberOfSides+=1;
	[self updateInterface];
}

- (void)updateInterface
{
	// save preference
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setInteger:polygon.numberOfSides forKey:@"defaultNumberOfSides"];
	
	// updating the interface
	slider.value = (float)polygon.numberOfSides;
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
	increaseButton.enabled = polygon.numberOfSides < polygon.maximumNumberOfSides;
	decreaseButton.enabled = polygon.numberOfSides > polygon.minimumNumberOfSides;
	[polygonView setNeedsDisplay]; 
	NSLog(@"%@", polygon);
}

- (IBAction)changeSlider
{
	polygon.numberOfSides = (int)slider.value;
	[self updateInterface];
}

- (int)defaultSides
{
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	int sides= [prefs integerForKey:@"defaultNumberOfSides"];
	return sides == 0 ? 4 : sides;
}

@end
