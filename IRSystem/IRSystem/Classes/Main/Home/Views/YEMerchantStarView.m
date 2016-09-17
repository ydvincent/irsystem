//
//  YEMerchantStarView.m
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEMerchantStarView.h"
#import "Masonry.h"

#define YEStarTagFlag   100
#define YEStarMaxValue  5

@implementation YEMerchantStarView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIView *lastView = nil;
    for (int i = 0; i < YEStarMaxValue; i ++) {
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = IMG(@"star_normal");
        imgView.tag = YEStarTagFlag + i;
        [self addSubview:imgView];
        
        MASViewAttribute *leading = (i==0) ? self.mas_leading : lastView.mas_trailing;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make){
            make.leading.equalTo(leading);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@18);
            make.width.equalTo(@18);
        }];
        
        lastView = imgView;
    }
}

- (void)setScore:(NSNumber *)score
{
    _score = score;
    
    for (int i = 0; i < YEStarMaxValue; i ++) {
        
        UIImageView *imgView = [self viewWithTag:YEStarTagFlag + i];
        if (i < [score intValue]) {
            imgView.image = IMG(@"star_selected");
        }
        else {
            imgView.image = IMG(@"star_normal");
        }
    }
}

@end
