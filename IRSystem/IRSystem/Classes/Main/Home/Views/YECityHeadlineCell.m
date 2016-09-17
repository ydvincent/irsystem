//
//  YECityHeadlineCell.m
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YECityHeadlineCell.h"

@interface YECityHeadlineCell ()

@property (nonatomic, strong) IBOutlet UIImageView *headImgView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *contentLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;


@end

@implementation YECityHeadlineCell

- (void)setNewsInfo:(YENewsInfo *)newsInfo
{
    _newsInfo = newsInfo;
    [self.headImgView setImageWithURL:YEURL(newsInfo.imgurl)
                          placeholder:IMG(@"image_default")];
    self.titleLabel.text = newsInfo.title;
    self.contentLabel.text = newsInfo.des;
    self.dateLabel.text = ye_stamp2Date(newsInfo.createdate.doubleValue,@"MM-dd");
}

@end
