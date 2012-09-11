//
//  ViewController.m
//  DayCountDown
//
//  Created by HoLin on 12-9-11.
//  Copyright (c) 2012年 HoLin. All rights reserved.
//

#import "ViewController.h"
#import "DayCountDownView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib. 
    [self.view addSubview:[[[DayCountDownView alloc] initWithFinishDateString:@"2012-09-12 12:30:01"] autorelease]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
