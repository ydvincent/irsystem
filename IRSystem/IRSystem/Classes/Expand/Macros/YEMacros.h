//
//  YEMacros.h
//  IRSystem
//
//  Created by Vincent on 16/9/14.
//  Copyright © 2016年 Vincent. All rights reserved.
//

#ifndef YEMacros_h
#define YEMacros_h


#define iPhone6OrLater ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ([[UIScreen mainScreen] currentMode].size.width > 640) : NO)

#define YENib(nib)  [UINib nibWithNibName:nib bundle:[NSBundle mainBundle]]
#define YERegistCollectionCell(sender,nibname) [sender registerNib:YENib(nibname) forCellWithReuseIdentifier:nibname]
#define YERegistTableCell(sender,nibname) [sender registerNib:YENib(nibname) forCellReuseIdentifier:nibname]

#define YETabelHeadView(h) [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, h)]

#define YEUserDefaults  [NSUserDefaults standardUserDefaults]
#define YEUserDefaultsValue(key) [YEUserDefaults objectForKey:key]

#define YERandomColor [UIColor colorWithRed:arc4random_uniform(235)/255.0 green:arc4random_uniform(235)/255.0 blue:arc4random_uniform(235)/255.0 alpha:1]

#define YEURL(url) [NSURL URLWithString:url]

#define WEAKSELF typeof(self) __weak weakSelf = self;

#define YEBackgroundColor UIColorFromRGB(0xf7f7f7)

//获取系统版本
#define YE_VERSION [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define YE_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/* ********************图片********************* */

//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//获取Image
#define IMG(NAME) [UIImage imageNamed:(NAME)]
#define OrigIMG(a) [IMG(a) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

/* ********************颜色类********************* */

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define YE_isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define YE_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define YE_isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 等于 某个系统版本
#define YE_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
// 高于 某个系统版本
#define YE_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
// 大于等于 某个系统版本
#define YE_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// 小于 某个系统版本
#define YE_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
// 小于等于 某个系统版本
#define YE_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


//---------------------inline methods--------------------------

static inline BOOL ye_isZeroFloat(float f) {
    
    const float EPSINON = 0.0001;
    if ((f >= -EPSINON) && f <= EPSINON) {
        return YES;
    }
    return NO;
}

static inline BOOL ye_isEmpty(id thing) {
    
    return thing == nil ||
    [thing isEqual:[NSNull null]] ||
    [thing isEqual:@"null"] ||
    [thing isEqual:@"(null)"] ||
    ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0) ||
    ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

static inline NSString *ye_stringFromObject(id object) {
    if (object == nil ||
        [object isEqual:[NSNull null]] ||
        [object isEqual:@"(null)"] ||
        [object isEqual:@"null"]) {
        return @"";
    } else if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object respondsToSelector:@selector(stringValue)]){
        return [object stringValue];
    } else {
        return [object description];
    }
}

static inline NSString *ye_setNull(NSString *obj) {
    if (obj == nil ||
        [obj isEqual:[NSNull null]] ||
        [obj isEqual:@"(null)"] ||
        [obj isEqual:@"null"]) {
        return @"";
    }
    return obj;
}

static inline NSString *ye_stamp2Date(NSTimeInterval obj,NSString *format) {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:obj / 1000];
    
    NSDateFormatter *formattter = [[NSDateFormatter alloc] init];
    [formattter setDateFormat:format];
    return [formattter stringFromDate:date];
}

#endif /* YEMacros_h */
