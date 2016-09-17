//
//  YEHomeMerchantCell.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeMerchantCell.h"
#import "YEMerchantStarView.h"

@interface YEHomeMerchantCell ()

@property (nonatomic, strong) IBOutlet UIImageView *headImgView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *typeLabel;
@property (nonatomic, strong) IBOutlet YEMerchantStarView *starView;

@end

@implementation YEHomeMerchantCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMerchantInfo:(YEHotMerchantInfo *)merchantInfo
{
    _merchantInfo = merchantInfo;
    
    [self.headImgView setImageWithURL:YEURL(merchantInfo.picurl) placeholder:IMG(@"image_default")];
    self.titleLabel.text = merchantInfo.title;
    self.typeLabel.text = merchantInfo.typenname;
    self.starView.score = merchantInfo.score;
}

@end
