//
//  DayCountDownView.m
//  DayCountDown
//
//  Created by HoLin on 12-9-11.
//  Copyright (c) 2012年 HoLin. All rights reserved.
//

#import "DayCountDownView.h"

@interface DayCountDownView() {
    UILabel *lbShow;
    NSTimer *timer;
}

- (NSString*)formateDate:(NSDate*)date_;
- (NSDate *)dateFromString:(NSString *)string;

@end

@implementation DayCountDownView

@synthesize finishDate;

- (id)initWithFinishDate:(NSDate*)date_
{
    self = [super initWithFrame:CGRectMake(0, 0, 200, 30)];
    if (self) {
        self.finishDate = date_;
        lbShow = [[UILabel alloc] initWithFrame:self.bounds];
        lbShow.text = [self formateDate:self.finishDate];
        lbShow.backgroundColor = [UIColor clearColor];
        [self addSubview:lbShow];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateShow) userInfo:nil repeats:YES];
    }
    return self;
}

- (id)initWithFinishDateString:(NSString*)dateStr_
{
    NSDate *date = [self dateFromString:dateStr_];
    return [self initWithFinishDate:date];
}

- (void)dealloc {
    self.finishDate = nil;
    [lbShow release];
    [timer invalidate];
    [super dealloc];
}

- (void)updateShow {
    lbShow.text = [self formateDate:self.finishDate];
}


#pragma mark - Helper
- (NSString*)formateDate:(NSDate*)date_ {
    NSTimeInterval inteval = [date_ timeIntervalSinceDate:[NSDate date]];

    static const int day = 24 * 60 * 60;
    static const int hour = 60 * 60;
    static const int minute = 60;
    
    int leftDay = inteval / day;
    inteval -= leftDay * day;
    int leftHour = inteval / hour;
    inteval -= leftHour * hour;
    int leftMinute = inteval / minute;
    inteval -= leftMinute * minute;
    int leftSecond = inteval;
    
    NSString *dateString = nil;
    dateString = [NSString stringWithFormat:@"%d天 %02d : %02d : %02d",
                                        leftDay, leftHour, leftMinute, leftSecond];
    return dateString;
    
}

- (NSDate *)dateFromString:(NSString *)string {
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date = [inputFormatter dateFromString:string];
	[inputFormatter release];
	return date;
}


@end
