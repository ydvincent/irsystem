//
//  YEHomeNavTitleView.m
//  IRSystem
//
//  Created by Vincent on 16/9/15.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeNavTitleView.h"
#import "Masonry.h"

@interface YEHomeNavTitleView ()<UITextFieldDelegate>



@end


@implementation YEHomeNavTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    /*
    UILabel *bottomLine = [UILabel new];
    bottomLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.leading.equalTo(self.mas_leading).offset(5);
        make.trailing.equalTo(self.mas_trailing).offset(-5);
        make.height.equalTo(@1);
    }];
     */
    
    self.backgroundColor = [UIColor colorWithHexString:@"0xBE2B14"];
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    
    
    UIImageView *searchImgView = [UIImageView new];
    searchImgView.image = [UIImage imageNamed:@"home_search_icon"];
    [self addSubview:searchImgView];
    [searchImgView mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(self.mas_leading).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@13);
        make.width.equalTo(@13);
    }];
    
    _inputView = [UITextField new];
    _inputView.textColor = [UIColor whiteColor];
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:11],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]};
    _inputView.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索商家、商铺" attributes:attributes];
    _inputView.font = [UIFont systemFontOfSize:11];
    _inputView.delegate = self;
    [self addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.equalTo(searchImgView.mas_trailing).offset(6);
        make.trailing.equalTo(self.mas_trailing).offset(5);
        make.centerY.equalTo(searchImgView);
        make.height.equalTo(@24);
    }];
}

@end
