//
//  YEHomeBannerReusableView.m
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeBannerReusableView.h"
#import "YEBannerInfo.h"

@interface YEHomeBannerReusableView ()

@property (nonatomic, strong) IBOutlet SDCycleScrollView  *cycleView;

@end

@implementation YEHomeBannerReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cycleView.infiniteLoop = NO;
}

- (void)setBannerGroup:(NSMutableArray *)bannerGroup
{
    _bannerGroup = bannerGroup;
    
    if (_bannerGroup.count) {
        self.cycleView.localizationImageNamesGroup = nil;
        
        NSMutableArray *list = [@[] mutableCopy];
        for (YEBannerInfo *info in bannerGroup) {
            [list addObject:info.picurl];
        }
        self.cycleView.imageURLStringsGroup = list;
        self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    }
}

@end
