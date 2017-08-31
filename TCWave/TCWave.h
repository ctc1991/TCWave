//
//  TCWave.h
//  TCWave_Demo
//
//  Created by Tech on 2017/8/31.
//  Copyright © 2017年 ctc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCWave : UIView
/** 水的颜色 */
@property (nonatomic, strong) UIColor *waterColor;
/** 波浪变化的频率 */
@property (nonatomic) CGFloat refreshFrequency;
/** 振幅 默认 10*/
@property (nonatomic) CGFloat waveHeight;
@end
