//
//  ChangeViewController.m
//  openSiS
//
//  Created by os4ed on 4/7/16.
//  Copyright © 2016 openSiS. All rights reserved.
//

#import "ChangeViewController.h"
#import "AppDelegate.h"
#import "ip_url.h"
#import "AFNetworking.h"
#import "SettingViewController.h"
#import "S_ReportViewController.h"
#import "SettingViewController.h"
#import "MsgViewController.h"
#import "SdashboardViewController.h"

@interface ChangeViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *text_currentpass;
@property (strong, nonatomic) IBOutlet UITextField *text_newpass;
@property (strong, nonatomic) IBOutlet UITextField *text_confirmpas;

@end

@implementation ChangeViewController
{
    NSString *curpas,*newpas,*confpas;
    
    NSString *student_id,*s_year_id,*s_year;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self dodesignforTextFields:self.text_confirmpas];
    [self dodesignforTextFields:self.text_currentpass];
    [self dodesignforTextFields:self.text_newpass];
  
}

- (IBAction)actionSave:(id)sender {
    
    
    curpas = self.text_currentpass.text;
    newpas = self.text_newpass.text;
    confpas = self.text_confirmpas.text;
    
    if (curpas.length > 0 && newpas.length > 0 && confpas.length > 0) {
        if ([newpas isEqualToString:confpas]) {
            [self savedataongroups];
        }
        else
        {
            [self alertmsg:@"New Password doesn't match with Confirm Password"];
        }
    }
    else
    {
        [self alertmsg:@"No field can be empty"];
    }
    
    
}


-(IBAction)settting:(id)sender
{
    
    UIStoryboard * sb=[UIStoryboard storyboardWithName:@"StudentDashboard" bundle:nil];
    SettingViewController * mvc=[[SettingViewController alloc]init];
    mvc=[sb instantiateViewControllerWithIdentifier:@"Setting"];
    [self.navigationController pushViewController:mvc animated:NO];
    
    
}



- (void)savedataongroups
{
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STUDENT_ID"]];
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    
    
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    
    NSString *urlStr = [NSString stringWithFormat:@"/student/stu_change_pwd.php"];
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,urlStr];
    //
    //    NSLog(@"----%@",url12);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url12]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    //  patameter image
    // school_id=1&syear=2015&staff_id=2&cpv_id=24&mp_id=16&values=
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"student_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[student_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"school_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[s_year_id dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"syear\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[s_year dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"current\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[curpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"new\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[newpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"verify\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[confpas dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    NSLog(@"request...%@",request);
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSLog(@"======%@",returnData);
    //   NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary  *datadic=[[NSMutableDictionary alloc]init];
    datadic = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:NULL];
    NSLog(@"datadic-------%@",datadic);
    [self alertmsg:[NSString stringWithFormat:@"%@",[datadic objectForKey:@"msg"]]];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self action_cancel:nil];
}
- (IBAction)action_cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)dodesignforTextFields:(UITextField *)disview
{
    // [disview.layer setBorderColor:[[UIColor colorWithRed:0.816f green:0.816f blue:0.816f alpha:1.00f]CGColor]];
    //[disview.layer setBorderWidth:1.0f];
    [disview.layer setBorderColor:[[UIColor colorWithRed:0.620f green:0.620f blue:0.620f alpha:1.00f] CGColor]];
    [disview.layer setBorderWidth:1.0f];
    [disview.layer setCornerRadius:1.5f];
    
}

-(void)alertmsg:(NSString*)msg
{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
-(IBAction)home:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StudentDashboard" bundle: nil];
    SdashboardViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"studentdash"];
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(IBAction)Report:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StudentDashboard" bundle: nil];
    S_ReportViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"rprt"];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark---Msg
-(IBAction)msg:(id)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"StudentDashboard" bundle:[NSBundle mainBundle]];
    MsgViewController *mgc =[[MsgViewController alloc]init];
    mgc=[sb instantiateViewControllerWithIdentifier:@"msg"];
    [self.navigationController pushViewController:mgc animated:NO];
}
#pragma mark—Settings
-(IBAction)settings:(id)sender{
    UIStoryboard * sb=[UIStoryboard storyboardWithName:@"StudentDashboard" bundle:nil];
    SettingViewController * mvc=[[SettingViewController alloc]init];
    mvc=[sb instantiateViewControllerWithIdentifier:@"Setting"];
    [self.navigationController pushViewController:mvc animated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
