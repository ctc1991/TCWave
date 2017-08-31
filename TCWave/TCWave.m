//
//  TCWave.m
//  TCWave_Demo
//
//  Created by Tech on 2017/8/31.
//  Copyright © 2017年 ctc. All rights reserved.
//

#import "TCWave.h"

@interface TCWave ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat distance;
@end

@implementation TCWave

- (instancetype)init {
    if (self = [super init]) {
        _waveHeight = 10;
        _waterColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _waveHeight = 10;
        _waterColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _waveHeight = 10;
    _waterColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
}


- (void)setRefreshFrequency:(CGFloat)refreshFrequency {
    _refreshFrequency = refreshFrequency;
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:refreshFrequency target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
}

-(void)animateWave {
    self.distance += 0.1;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, self.waterColor.CGColor);
    CGContextSetStrokeColorWithColor(context, self.waterColor.CGColor);
    
    float y = _waveHeight/2;
    CGPathMoveToPoint(path, NULL, 0, y);
    
    for(float x=0;x<=rect.size.width;x++){
        y = _waveHeight/2 * sin(x/(rect.size.width*0.5)*M_PI + self.distance) + _waveHeight/2;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _waveHeight/2);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}


@end
