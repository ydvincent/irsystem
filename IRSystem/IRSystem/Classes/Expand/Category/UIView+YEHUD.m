//
//  UIView+YEHUD.m
//  IRSystem
//
//  Created by Vincent on 16/9/16.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "UIView+YEHUD.h"
#import "MBProgressHUD.h"

@implementation UIView (YEHUD)

- (void)showHUDWithTitle:(NSString *)title {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = title;
    //hud.backgroundColor = [UIColor colorWithWhite:0.f alpha:.5];
}

- (void)showHUD {
    [self showHUDWithTitle:@"正在加载"];
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

@end
