//
//  YEHomeAdsFuncCell.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeAdsFuncCell.h"

@interface YEHomeAdsFuncCell ()

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *desLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imgView;

@end

@implementation YEHomeAdsFuncCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.layer.cornerRadius = 20;
    self.imgView.layer.masksToBounds = YES;
}

- (void)setBannerInfo:(YEBannerInfo *)bannerInfo
{
    _bannerInfo = bannerInfo;
    self.titleLabel.text = bannerInfo.title;
    self.desLabel.text = bannerInfo.tag;
    self.desLabel.textColor = YERandomColor;
    self.imgView.imageURL = YEURL(bannerInfo.picurl);
}

@end
