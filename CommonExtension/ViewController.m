//
//  ViewController.m
//  CommonExtension
//
//  Created by charls on 16/9/7.
//  Copyright © 2016年 Charls. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

#import "CharlsCategories.h"
#import "VerifyUtilities.h"

#import "UIColor+Charls.h"



@interface Tag : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int length;

@end

@implementation Tag

@end

@interface Note : NSObject

@property (nonatomic, copy) NSString *name;             //!  名称
@property (nonatomic, copy) NSString *content;          //!  内容
@property (nonatomic, strong) NSDate *createDate;   //!   创建时间
@property (nonatomic, strong) NSArray *users;

@end

@implementation Note

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 50);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.textColor = [UIColor grayColor];
    label.text = @"我是OC版 常用类目";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
//    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"123",@"456",@"张卫健"]];
//    NSLog(@"%@",[arr plistString]);
//    NSLog(@"%@",[NSMutableArray arrayWithPlistString:[arr plistString]]);
//    NSLog(@"%@",[arr jsonStringEncoded]);
    
    NSDictionary *dic = @{@"name":@"Charls",@"age":@18,@"sex":@1};
    NSLog(@"%@",[dic allSortedKeys]);
    NSLog(@"%@",[dic allSortedValues]);
    NSLog(@"%@",[dic sortForSortedKeys]);
    NSLog(@"%d",[dic containsObjectForKey:@"name"]);
    
    
//    UIView *head = [[UIView alloc] init];
//    NSLog(@"%@",[head class]);
    
    
    NSLog(@"%@",[[NSDate yesterday] stringWithCommonFormatAndShowThisYear:NO]);
    
    [NSTimer scheduledTimerWithTimeInterval:5 block:^{
        NSLog(@"计时器执行...");
    } repeats:NO];
    
    // 动态属性
    Note *note = [[Note alloc] init];
    note.name = @"笔记";
    note.content = @"内容";
    
    Tag *tag = [[Tag alloc] init];
    tag.name = @"Charls";
    tag.length = 14;
    
    note.users = @[tag,tag,tag];
    note.createDate = [NSDate date];
    NSDate *handleDate = [[NSDate date] dateByAddingDays:1];
    [note setAssociatedRetainValue:handleDate withKey:"handleDate"];
    
    NSLog(@"对象动态属性%@",[note getAssociatedValueForKey:"handleDate"]);
    NSLog(@"对象属性arr%@",[note getAllProperties]);
    NSLog(@"对象%@",note);
    NSLog(@"属性dict__%@",[note properties_aps]);

   
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(100, 100, 80, 30)];
    [btn setTitle:@"touch" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    NSLog(@"______%d",[VerifyUtilities isMobile:@"13631130332"]);
    NSLog(@"%d",[VerifyUtilities isEmail:@"961629701@qq.com"]);
    NSLog(@"%d",[VerifyUtilities isPureInt:@"123"]);
    NSLog(@"%d",[VerifyUtilities isPureFloat:@"123.123"]);
    NSLog(@"%d",[VerifyUtilities isChinese:@"中"]);
    NSLog(@"%d",[VerifyUtilities isURL:@"http://www.baodu.com"]);
    NSLog(@"%d",[VerifyUtilities verifyIDCardNumber:@"440981199301053238"]);
    
    
    UIColor *color = [UIColor randomColor];
    //[UIColor colorWithHexString:@"0xfdbdee"];
    
//    UIColor *color2 = UIColor_RGB(100, 122, 255);
    btn.backgroundColor = color;
    
    
    
    NSLog(@"randomColors->>>%@",[UIColor randomColorsWithCount:0]);
    NSLog(@"hex->>%@",[UIColor hexStringFromColor:[UIColor randomColor]]);
    NSLog(@"lightSalmon->>%@",[UIColor lightSalmonColor]);
    
    
    
}

- (void)btnClicked:(UIButton *)btn {
    

    NSLog(@"%@",[btn getCurrentViewController]);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
