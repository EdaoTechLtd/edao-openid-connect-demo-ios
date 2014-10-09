//
//  MasterViewController.m
//  EdaoOpenIDConnectDemo
//
//  Created by 李嘉鑫 on 14-8-26.
//  Copyright (c) 2014年 李嘉鑫. All rights reserved.
//

#import "MasterViewController.h"
#import "DoneViewController.h"
#import "EdaoOpenIDConnectSDK.h"

#define PublicKey @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCANELcdE0uzTQ431SkuyN4RCQ0z0TCecSUhXQ0sOy9FITTnlzUs8Uja8K0dKp3Exxfegxf5USDtn1RA/22hMwYJ+3ovxHw5jxaQ0Vp8dXBTh08bCFXhvyHfjDC/8B4KAGkSkCyR3f4meFXQefa2GWTxqnf8LMJCnZTrGIFkwaB/wIDAQAB"

@interface MasterViewController ()<EdaoOpenIDConnectDelegate>

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)edaoLogin:(id)sender
{
    [EdaoOpenIDConnectSDK clientName:@"EdaoSysPer" callBack:@"http://localhost" credentials:PublicKey delegate:self];
}

/**
 *	@brief	翼道登录操作返回结果
 *
 *	@param 	result 	登录结果
 */
-(void)edaoOpenIDConnectDidLoginResult:(NSDictionary*)result
{
    NSInteger errorCode = [[result objectForKey:@"errorCode"] integerValue];
    NSString *errorDesc = [result objectForKey:@"errorDesc"];
    NSString *openid = [result objectForKey:@"openid"];
    
    if (errorCode == EdaoOIDConnErrorCode_Success) {
        
        DoneViewController *done = [self.storyboard instantiateViewControllerWithIdentifier:@"DoneViewController"];
        [done setOpenid:openid];
        [self.navigationController pushViewController:done animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:errorDesc delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        [alert show];
    }
}

@end
