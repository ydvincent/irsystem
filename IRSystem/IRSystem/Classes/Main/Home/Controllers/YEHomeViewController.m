//
//  YEHomeViewController.m
//  IRSystem
//
//  Created by Vincent on 16/9/5.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#import "YEHomeViewController.h"
#import "YECityHeadlineVC.h"

#import "YEHomeNavTitleView.h"
#import "YEHomeMainFuncCell.h"
#import "YEHomeTypeFuncCell.h"
#import "YEHomeAdsFuncCell.h"
#import "YEHomeHeadlinesCell.h"
#import "YEHomeMerchantCell.h"
#import "YEHomeCellHeadView.h"
#import "YEHomeBannerReusableView.h"

#import "YEGetHomeDataApi.h"

@interface YEHomeViewController ()<UITextFieldDelegate, UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@property (nonatomic ,strong) YEHomeNavTitleView *navTitleView;

@property (nonatomic, strong) NSMutableArray *bannerArray;  //顶部bannner
@property (nonatomic, strong) NSMutableArray *mainFuncArray;  // 主模块
@property (nonatomic, strong) NSMutableArray *typeFuncArray;  // 类型模块
@property (nonatomic, strong) NSMutableArray *adsFuncArray;   // 广告模块
@property (nonatomic, strong) YENewsInfo *cityHeadlines;        //同城头条
@property (nonatomic, strong) NSMutableArray *hotMerchantArray; //热门商家

@end

@implementation YEHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBarButtonItems];
    [self registCollectionReuseViews];
    
    [self parseServerData:YEUserDefaultsValue(YEUserDefaultsHomeDataKey)];
    
    [self requestServerHomeData];
}

#pragma mark - privtae methods

- (void)configBarButtonItems
{
    // 扫码Item
    UIBarButtonItem *scanItem = [[UIBarButtonItem alloc] initWithImage:IMG(@"home_scan_icon") style:UIBarButtonItemStyleDone target:self action:@selector(handleScanClickEvent)];
    self.navigationItem.leftBarButtonItem = scanItem;
    
    self.navigationItem.titleView = self.navTitleView;
    
    //消息item
    UIBarButtonItem *msgItem = [[UIBarButtonItem alloc] initWithImage:IMG(@"home_msg_icon") style:UIBarButtonItemStyleDone target:self action:@selector(handleMessageClickEvent)];
    self.navigationItem.rightBarButtonItem = msgItem;
}

- (void)registCollectionReuseViews
{
    YERegistCollectionCell(self.collectionView, @"YEHomeMainFuncCell");
    YERegistCollectionCell(self.collectionView, @"YEHomeTypeFuncCell");
    YERegistCollectionCell(self.collectionView, @"YEHomeAdsFuncCell");
    YERegistCollectionCell(self.collectionView, @"YEHomeHeadlinesCell");
    YERegistCollectionCell(self.collectionView, @"YEHomeMerchantCell");
    
    [self.collectionView registerNib:YENib(@"YEHomeCellHeadView")
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:@"YEHomeCellHeadView"];
    [self.collectionView registerNib:YENib(@"YEHomeBannerReusableView")
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:@"YEHomeBannerReusableView"];
}

#pragma mark - event response

- (void)handleScanClickEvent
{
    
}

- (void)handleMessageClickEvent
{
    
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.mainFuncArray.count;
        case 1:
            return self.typeFuncArray.count;
        case 2:
            return self.adsFuncArray.count;
        case 3:
            return 1;
        case 4:
            return self.hotMerchantArray.count;
        default:
            return 0;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        //
        if (indexPath.section == 0) {
            
            YEHomeBannerReusableView *bannerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YEHomeBannerReusableView" forIndexPath:indexPath];
            bannerView.bannerGroup = self.bannerArray;
            return bannerView;
        }
        else if (indexPath.section == 3) {
            
            YEHomeCellHeadView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YEHomeCellHeadView" forIndexPath:indexPath];
            reusableView.title = @"同城头条";
            reusableView.showDisclosureIndicator = YES;
            WEAKSELF
            reusableView.handleDisclosureBlock = ^{
                YECityHeadlineVC *vc = [[YECityHeadlineVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            return reusableView;
        }
        else if (indexPath.section == 4) {
            
           YEHomeCellHeadView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YEHomeCellHeadView" forIndexPath:indexPath];
            reusableView.title = @"热门商家";
            reusableView.showDisclosureIndicator = NO;
            return reusableView;
        }
    }
    
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    //主模块
    if (indexPath.section == 0) {
        YEHomeMainFuncCell *mainCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YEHomeMainFuncCell" forIndexPath:indexPath];
        mainCell.model = self.mainFuncArray[indexPath.item];
        cell = mainCell;
    }
    //业务模块
    else if (indexPath.section == 1) {
        YEHomeTypeFuncCell *typeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YEHomeTypeFuncCell" forIndexPath:indexPath];
        typeCell.model = self.typeFuncArray[indexPath.item];
        cell = typeCell;
    }
    //广告模块
    else if (indexPath.section == 2) {
        YEHomeAdsFuncCell *adsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YEHomeAdsFuncCell" forIndexPath:indexPath];
        adsCell.bannerInfo = self.adsFuncArray[indexPath.item];
        cell = adsCell;
    }
    //头条模块
    else if (indexPath.section == 3) {
        YEHomeHeadlinesCell *headlineCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YEHomeHeadlinesCell" forIndexPath:indexPath];
        headlineCell.newsInfo = self.cityHeadlines;
        cell = headlineCell;
    }
    //热门商家
    else {
        YEHomeMerchantCell *hotCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YEHomeMerchantCell" forIndexPath:indexPath];
        hotCell.merchantInfo = self.hotMerchantArray[indexPath.item];
        cell = hotCell;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    else if (indexPath.section == 1) {

    }
    else if (indexPath.section == 2) {
        
    }
    else if (indexPath.section == 3) {
        
    }
    else if (indexPath.section == 4) {
        
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        int width = SCREEN_WIDTH / 5;
        return CGSizeMake(width ,width + (iPhone6OrLater ? 18 : 25));
    }
    else if (indexPath.section == 1) {
        int width = (SCREEN_WIDTH - 4) / 5;
        return CGSizeMake(width, 50);
    }
    else if (indexPath.section == 2) {
        int width = (SCREEN_WIDTH -1) / 2;
        return CGSizeMake(width, 70);
    }
    else if (indexPath.section == 3) {
        return CGSizeMake(SCREEN_WIDTH, 90);
    }
    else {
        return CGSizeMake(SCREEN_WIDTH, 80);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        int width = SCREEN_WIDTH / 5;
        int margin = SCREEN_WIDTH - width * 5;
        int leftMargin = margin /2;
        return UIEdgeInsetsMake(0, leftMargin, 0, margin -leftMargin);
    }
    else if (section == 1) {
        int width = (SCREEN_WIDTH - 4) / 5;
        int margin = SCREEN_WIDTH - width * 5 - 4;
        int leftMargin = margin /2;
        return UIEdgeInsetsMake(1, leftMargin, 1, margin-leftMargin);
    }
    else if (section == 2) {
        int width = (SCREEN_WIDTH -1) / 2;
        int margin = SCREEN_WIDTH - width * 2 -1;
        int leftMargin = margin /2;
        return UIEdgeInsetsMake(10, leftMargin, 10, margin - leftMargin);
    }
    else if (section == 3) {
        return UIEdgeInsetsMake(1, 0, 10, 0);
    }
    else if (section == 4) {
        return UIEdgeInsetsMake(1, 0, 0, 0);
    }
    else {
        return UIEdgeInsetsZero;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section) {
        return 1;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section > 0 && section < 3) {
        return 1;
    }
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH / 3);
    }
    if (section == 3 || section == 4) {
        return CGSizeMake(SCREEN_WIDTH, 32);
    }
    return CGSizeZero;
}

#pragma mark - getter

- (YEHomeNavTitleView *)navTitleView
{
    if (!_navTitleView) {
        _navTitleView = [[YEHomeNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -100, 30)];
        _navTitleView.inputView.delegate = self;
    }
    return _navTitleView;
}

- (NSMutableArray *)mainFuncArray
{
    if (!_mainFuncArray) {
        _mainFuncArray = [@[] mutableCopy];
        
        NSArray *nameList = @[@"美味美食",@"服装服饰",
                              @"休闲娱乐",@"宾馆洗浴",
                              @"维修保养",@"美容美发",
                              @"求职招聘",@"婚纱摄影",
                              @"装修材料",@"农业资讯"];
        for (int i = 0; i < nameList.count; i++) {
            YEFuncModel *model = [[YEFuncModel alloc] init];
            model.name = nameList[i];
            model.image = [UIImage imageNamed:[NSString stringWithFormat:@"ic_category_%@",@(i)]];
            //mode.className = @"";
            [_mainFuncArray addObject:model];
        }
    }
    return _mainFuncArray;
}

- (NSMutableArray *)typeFuncArray
{
    if (!_typeFuncArray) {
        _typeFuncArray = [@[] mutableCopy];
        
        NSArray *nameList = @[@"家具家电",@"快送到家",
                              @"顺心出行",@"金融",
                              @"医药",@"购物",
                              @"学校",@"生活服务",
                              @"二手信息",@"房屋租赁"];
        for (int i = 0; i < nameList.count; i++) {
            YEFuncModel *model = [[YEFuncModel alloc] init];
            model.name = nameList[i];
            //mode.className = @"";
            [_typeFuncArray addObject:model];
        }
    }
    return _typeFuncArray;
}

#pragma mark - API

- (void)requestServerHomeData
{
    [self.view showHUD];
    YEGetHomeDataApi *api =[[YEGetHomeDataApi alloc] init];
    
    [api startRequest:^(YERequestStatus responseStatus, NSString *message, id responseObject) {
        
        [self.view hideHUD];
        if (responseStatus == YERequestStatusSuccess) {
            
            [self saveHomeData:responseObject];
            [self parseServerData:responseObject];
        } else {
            [self.view makeToast:message];
        }
    }];
}

- (void)parseServerData:(NSDictionary *)body
{
    NSArray *adBannerVos = body[@"adBannerVos"];
    self.bannerArray = [[YEBannerInfo mj_objectArrayWithKeyValuesArray:adBannerVos] mutableCopy];
    
    NSArray *adItemVos = body[@"adItemVos"];
    self.adsFuncArray = [[YEBannerInfo mj_objectArrayWithKeyValuesArray:adItemVos] mutableCopy];
    
    self.cityHeadlines = [YENewsInfo mj_objectWithKeyValues:body[@"newsVo"]];
    
    NSArray *businessVos = body[@"businessVos"];
    self.hotMerchantArray = [YEHotMerchantInfo mj_objectArrayWithKeyValuesArray:businessVos];
    
    [self.collectionView reloadData];
}

- (void)saveHomeData:(NSDictionary *)body
{
    [YEUserDefaults setObject:body forKey:YEUserDefaultsHomeDataKey];
}

@end
