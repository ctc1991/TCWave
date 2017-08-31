//
//  ViewController.m
//  TCWave_Demo
//
//  Created by Tech on 2017/8/31.
//  Copyright © 2017年 ctc. All rights reserved.
//

#import "ViewController.h"
#import "TCWave.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TCWave *wave;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _wave.refreshFrequency = 0.02;
    _wave.waveHeight = 20;
}

- (IBAction)change:(UISlider *)sender {
    switch (sender.tag) {
        case 101:
            _wave.refreshFrequency = sender.value;
            break;
        case 102:
            _wave.waveHeight = sender.value;
    }
}

@end
