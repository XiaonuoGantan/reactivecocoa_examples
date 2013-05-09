//
//  XGViewController.m
//  ReactiveCocoaExamples
//
//  Created by Xiaonuo Gantan on 2013-05-08.
//  Copyright (c) 2013 Xiaonuo Gantan. All rights reserved.
//

#import "XGViewController.h"

@interface XGViewController ()

@property (nonatomic,assign) NSInteger tappedTimes;
@property (nonatomic,retain) RACCompoundDisposable *compoundDisposable;

@end

@implementation XGViewController

- (void)dealloc {
    [self.compoundDisposable dispose];
    self.compoundDisposable = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.compoundDisposable = [RACCompoundDisposable compoundDisposable];
    @weakify(self);
    [self.compoundDisposable addDisposable:[[self.tapMeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.tappedTimes++;
    }]];
    [self.compoundDisposable addDisposable:[[RACAble(self.tappedTimes) distinctUntilChanged] subscribeNext:^(id x) {
        @strongify(self);
        self.tapMeLabel.text = [NSString stringWithFormat:@"Tapped %d times", self.tappedTimes];
    }]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
