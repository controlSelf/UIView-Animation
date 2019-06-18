//
//  ViewController.m
//  UIView+Animation
//
//  Created by benzhang on 2019/6/18.
//  Copyright © 2019 QingDong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.view addSubview:self.testView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.testView pushShowAnimation];
    });
    
}


- (UIView *)testView {
    if (!_testView) {
        _testView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
        _testView.backgroundColor = [UIColor darkGrayColor];
    }
    return _testView;
}

@end
