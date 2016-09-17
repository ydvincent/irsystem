//
//  YEHomeCellHeadView.h
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YEHomeCellHeadView : UICollectionReusableView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL showDisclosureIndicator;

@property (nonatomic, copy) void (^handleDisclosureBlock)();

@end
