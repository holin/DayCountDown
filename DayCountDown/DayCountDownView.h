//
//  DayCountDownView.h
//  DayCountDown
//
//  Created by HoLin on 12-9-11.
//  Copyright (c) 2012年 HoLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayCountDownView : UIView

@property (nonatomic, retain) NSDate *finishDate;

- (id)initWithFinishDate:(NSDate*)date_;
- (id)initWithFinishDateString:(NSString*)dateStr_;

@end
