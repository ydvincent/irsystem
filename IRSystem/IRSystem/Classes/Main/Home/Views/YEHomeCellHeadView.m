//
//  YEHomeCellHeadView.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeCellHeadView.h"

@interface YEHomeCellHeadView ()

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *arrowImgView;

@end

@implementation YEHomeCellHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setShowDisclosureIndicator:(BOOL)showDisclosureIndicator
{
    _showDisclosureIndicator = showDisclosureIndicator;
    self.arrowImgView.hidden = !showDisclosureIndicator;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (IBAction)disclosureIndicatorBtnClick:(id)sender
{
    if (self.handleDisclosureBlock) {
        self.handleDisclosureBlock();
    }
}


@end
