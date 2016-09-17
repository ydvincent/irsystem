//
//  YEHomeTypeFuncCell.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeTypeFuncCell.h"

@interface YEHomeTypeFuncCell ()

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;

@end

@implementation YEHomeTypeFuncCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(YEFuncModel *)model
{
    _model = model;
    self.nameLabel.text = model.name;
}

@end
