//
//  DoneViewController.m
//  EdaoOpenIDConnectDemo
//
//  Created by 李嘉鑫 on 14-8-26.
//  Copyright (c) 2014年 李嘉鑫. All rights reserved.
//

#import "DoneViewController.h"

@interface DoneViewController ()

-(IBAction)done:(id)sender;

@property (nonatomic,strong) IBOutlet UIButton *btnDone;

@end

@implementation DoneViewController

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
    
    [self.btnDone setTitle:[NSString stringWithFormat:@"OpenID:%@",self.openid] forState:UIControlStateNormal];
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

-(IBAction)done:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
