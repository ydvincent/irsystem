//
//  YEHomeMainFuncCell.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeMainFuncCell.h"

@interface YEHomeMainFuncCell ()

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *logoImgView;

@end

@implementation YEHomeMainFuncCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(YEFuncModel *)model
{
    _model = model;
    self.nameLabel.text = model.name;
    self.logoImgView.image = model.image;
}

@end
