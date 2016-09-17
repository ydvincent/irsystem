//
//  YEBaseTableViewController.h
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEBaseViewController.h"

@interface YEBaseTableViewController : YEBaseViewController<UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithStyle:(UITableViewStyle)style;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

// 是否显示 DZEmptyData
@property (nonatomic, assign) BOOL showEmptyDataSet;

@end
