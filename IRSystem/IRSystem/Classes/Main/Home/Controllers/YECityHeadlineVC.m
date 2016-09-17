//
//  YECityHeadlineVC.m
//  IRSystem
//
//  Created by Vincent on 16/9/17.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YECityHeadlineVC.h"

#import "YECityHeadlineCell.h"

#import "YEGetHeadlineListApi.h"

@interface YECityHeadlineVC ()

@end

@implementation YECityHeadlineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"同城头条";
    
    YERegistTableCell(self.tableView, @"YECityHeadlineCell");
    self.tableView.tableHeaderView = YETabelHeadView(0.1);
    
    [self requestCityheadlineList];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YECityHeadlineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YECityHeadlineCell"];
    cell.newsInfo = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark - API

- (void)requestCityheadlineList
{
    [self.view showHUD];
    YEGetHeadlineListApi *api =[[YEGetHeadlineListApi alloc] init];
    api.pagesize = @30;
    api.pageno = @1;
    
    [api startRequest:^(YERequestStatus responseStatus, NSString *message, NSArray* newsList) {
        
        [self.view hideHUD];
        if (responseStatus == YERequestStatusSuccess) {
            
            [self.dataSource addObjectsFromArray:newsList];
            [self.tableView reloadData];
        } else {
            [self.view makeToast:message];
        }
    }];
}


@end
