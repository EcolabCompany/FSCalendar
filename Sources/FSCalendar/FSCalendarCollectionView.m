//
//  FSCalendarCollectionView.m
//  FSCalendar
//
//  Created by Wenchao Ding on 10/25/15.
//  Copyright (c) 2015 Wenchao Ding. All rights reserved.
//
//  Reject -[UIScrollView(UIScrollViewInternal) _adjustContentOffsetIfNecessary]


#import "Include/FSCalendarCollectionView.h"
#import "FSCalendarExtensions.h"
#import "Include/FSCalendarConstants.h"

@interface FSCalendarCollectionView ()

- (void)commonInit;

@end

@implementation FSCalendarCollectionView

@synthesize scrollsToTop = _scrollsToTop, contentInset = _contentInset;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.scrollsToTop = NO;
    self.contentInset = UIEdgeInsetsZero;
    if (@available(iOS 10.0, *)) self.prefetchingEnabled = NO;
    if (@available(iOS 11.0, *)) self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.internalDelegate && [self.internalDelegate respondsToSelector:@selector(collectionViewDidFinishLayoutSubviews:)]) {
        [self.internalDelegate collectionViewDidFinishLayoutSubviews:self];
    }
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    [super setContentInset:UIEdgeInsetsZero];
    if (contentInset.top) {
        self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y+contentInset.top);
    }
}

- (void)setScrollsToTop:(BOOL)scrollsToTop
{
    [super setScrollsToTop:NO];
}

@end



