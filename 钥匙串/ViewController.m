//
//  ViewController.m
//  钥匙串
//
//  Created by 薛泽军 on 16/3/3.
//  Copyright © 2016年 百校科技. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *SERVICE_NAME=@"com.bxkj.---";//最好用程序的bundle id
    NSString *passWord=[SFHFKeychainUtils getPasswordForUsername:@"uuid"
                                                     andServiceName:SERVICE_NAME error:nil];
    if ([passWord length]<=0)
    {
        NSString *uuid=[self uuid];
        [SFHFKeychainUtils storeUsername:@"uuid"
                             andPassword:uuid
                          forServiceName:SERVICE_NAME
                          updateExisting:1
                                   error:nil];
        passWord=uuid;
    }
    //存储钥匙串账号密码
    //通过账号寻找密码
    
    NSLog(@"%@",passWord);
    // Do any additional setup after loading the view, typically from a nib.
}
//uuid也是设备唯一标示但是重新安装会不同所以把它存储起来
-(NSString*) uuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
