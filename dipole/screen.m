//
//  screen.m
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "screen.h"

@implementation screen

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

    }
    return self;
}

-(void) addParticleWithX: (double) x y: (double) y mass:(double)m charge: (double) cg
{
    CGPoint cor;
    cor.x = x;
    cor.y = y;
    [particles addObject:[[particle alloc]initwithcharge:cg coor:cor mass:m]];
    [self setNeedsDisplay];

}

-(void) evoleOneSecond
{
    for(int a = 0 ; a<[particles count];a++)
    {
        double accelerationX=0;
        double accelerationY=0;
        for(int b =0; b<[particles count];b++)
        {
            
            if(b != a)
            {
                accelerationX +=[[particles objectAtIndex:a] calculateAccelerationX:[[particles objectAtIndex:b]getCoor] charge:[[particles objectAtIndex:b]getCharge]] ; 
                accelerationY +=[[particles objectAtIndex:a] calculateAccelerationY:[[particles objectAtIndex:b]getCoor] charge:[[particles objectAtIndex:b]getCharge]];
            }
        }
        if(haveField)
        {
            accelerationX+= [[particles objectAtIndex:a] fieldAccelerationX: fieldCharge angle:fieldAngle];
            accelerationY+= [[particles objectAtIndex:a] fieldAccelerationY: fieldCharge angle:fieldAngle];
        }
        
        [[particles objectAtIndex:a] changeVelocity:accelerationX Y:accelerationY];
    }
    for(particle * a in particles)
        [a travel:timeinc];
    
    [self setNeedsDisplay];
   
}
-(BOOL)deleteLastObject
{
    [particles removeObjectAtIndex:[particles count]-1];
    if([particles count] == 0)
        return YES;
    else return NO;
    
}

-(void) startUp
{
    particles = [[NSMutableArray alloc]init];
     timeinc = 0.05;
    haveField = NO;
    fieldAngle =45;
    fieldCharge = 5000000;
}
-(void) clear
{
    [particles release];
    particles = [[NSMutableArray alloc]init];
}

-(void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect scale;
    CGPoint a;
    a.x = 10;
    a.y = 550;
    CGSize s;
    s.width = 100;
    s.height = 2;
    scale.size = s;
    scale.origin = a;
    CGContextFillRect(context, scale);
    
    for(particle *a in particles)
    {
        CGContextSetLineWidth(context,[a getMass]*10);
        CGContextAddArc(context, [a getCoor].x, [a getCoor].y, [a getMass]*5, 0, M_PI*2, 1);
        [[a getColor] setStroke];
        CGContextStrokePath(context);
    }

    
}

-(void) setFieldWithCharge: (double)cg angle: (double) ang
{
    fieldAngle = ang;
    fieldCharge = cg;
    haveField =YES;
}
-(void) clearField
{
    haveField = NO;
}


@end
