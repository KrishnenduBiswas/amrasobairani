//
//  Grade_detail_ViewController.m
//  openSiS
//
//  Created by os4ed on 3/15/16.
//  Copyright © 2016 openSiS. All rights reserved.
//

#import "Grade_detail_ViewController.h"
#import "Grade_s_ViewController.h"
#import "Gradebook_s_ViewController.h"
#import "AFNetworking.h"
#import "Grade_detailedTableViewCell.h"
#import "AppDelegate.h"
#import "ip_url.h"
#import "SdashboardViewController.h"
#import "S_ReportViewController.h"
#import "SettingViewController.h"
#import "MsgViewController.h"


@interface Grade_detail_ViewController ()<UIPickerViewDataSource ,UIPickerViewDelegate>
{

    UIPickerView * selectcustomerpicker;
    NSString *s;
    NSArray *arry,*mainary;
    NSMutableArray *gradeary , *gradedatary;
    NSMutableArray *ary, *grade_array ,*course_title ,*c_ary ,*g_ary;
    NSMutableArray * arynew;
    NSString    * student_id,*view_select,*s_year,*s_year_id ,*mp_id ,*action_type;



}
@property (strong,nonatomic) IBOutlet UIView *view_coursePeriodName;
@end

@implementation Grade_detail_ViewController
-(IBAction)thirdButton:(id)sender
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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    arry=[[NSArray alloc]initWithObjects:@"Totals",@"Detailed", nil ];
    mainary=[[NSArray alloc]initWithObjects:@"Totals",@"Detailed",@"sfds",@"sfdfd",@"Totals",@"Detailed",@"sfds",@"sfdfd", nil ];
    
    [self courseperiod123];
    // Do any additional setup after loading the view from its nib.
    [self loaddata];
    
    
    
    tblsec.tableFooterView=[[UIView alloc]init];
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [_view_coursePeriodName.layer setCornerRadius:2.0f];
    _view_coursePeriodName.layer.borderWidth = 1.0f;
    _view_coursePeriodName.clipsToBounds = YES;
    _view_coursePeriodName.layer.borderColor = [[UIColor colorWithRed:0.259f green:0.608f blue:0.831f alpha:1.00f]CGColor];
}


-(void)courseperiod123{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker  .delegate = self;
    
    selectcustomerpicker .dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=60;
    _mp_text.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked1)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
   _mp_text.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    return 1;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if (pickerView.tag==60)
    {
        
        return arry.count;
    }
    
    return 0;
    
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    if (pickerView.tag==60)
    {
        return [arry objectAtIndex:row];
    }
    
    //
    return 0;
    
    
    
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    
    
    if (pickerView.tag==60) {
        
        
        _mp_text.text=[arry objectAtIndex:[selectcustomerpicker selectedRowInComponent:0]];
        
    }
    
}
-(void)pickerDoneClicked1

{
    NSLog(@"Done Clicked");
    
    [_mp_text resignFirstResponder];
    
    NSString * strmp= _mp_text.text;
    if ([strmp isEqualToString:@"Totals"]) {
        
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"StudentDashboard" bundle:nil];
        Grade_s_ViewController *obj =[[Grade_s_ViewController alloc]init];
        obj=[sb instantiateViewControllerWithIdentifier:@"Grdbook"];
        
        
        [self.navigationController pushViewController:obj animated:NO];
        

    }
    
}
-(IBAction)back:(id)sender
{
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StudentDashboard" bundle: nil];
//    Gradebook_s_ViewController * sd = [storyboard instantiateViewControllerWithIdentifier:@"Grdbook"];
//    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(void)loaddata
{
   
    
    //http://107.170.94.176/openSIS_CE6_Mobile/webservice/student/stu_gradebook_grades.php?student_id=1&school_id=1&syear=2015&mp_id=17&action_type=expanded&id=all
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STUDENT_ID"]];
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    
    mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/student/stu_gradebook_grades.php?student_id=%@&school_id=%@&syear=%@&mp_id=%@&action_type=expanded&id=all",student_id,s_year_id,s_year,mp_id];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    gradeary =[[NSMutableArray alloc]init];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary1=[[NSMutableDictionary alloc]init];
        dictionary1 = (NSMutableDictionary *)responseObject;
        
        ary=[dictionary1 objectForKey:@"detailed_grade"];
        
        NSLog(@"------------------------------------%@",ary);
        g_ary=[[NSMutableArray alloc]init];
        c_ary=[[NSMutableArray alloc]init];
        
        
        
        
        
        
        
        for (int i=0; i<ary.count; i++) {
            
            
            
            course_title=[[ary objectAtIndex:i]objectForKey:@"course_title" ];
            NSLog(@">>>>>>%@",course_title);
            grade_array=[[ary objectAtIndex:i]objectForKey:@"gradebook_grade_data"];
            NSLog(@"grade ary>>>>>>%@", grade_array);
            
            
            
            //NSLog(@">>>>>>%@",course_title);
            
            
            [g_ary addObject:course_title];
            [c_ary addObject:grade_array];
            
            
            
            
            
        }
        
        
        NSLog(@">>>>>>;;;;;;;;%@",g_ary);
        NSLog(@"............%@",c_ary);
        
        

            
            
        
        
        [tblsec reloadData];
        
    
        
     
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    
    [operation start];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    for (int i=0; i<ary.count; i++) {
        
        
        if (section==i) {
            course_title=[[ary objectAtIndex:i]objectForKey:@"course_title" ];
            NSLog(@"%@",course_title);
            
            grade_array=[[ary objectAtIndex:i]objectForKey:@"gradebook_grade_data"];
            
            return grade_array.count;
            
        }
        
        
        
    }
    
    
    
    return 0;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return g_ary.count;
}
//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString *headerTitle;
//    
//    return headerTitle=[g_ary objectAtIndex:section];
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    Grade_detailedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"AAA"];
 
    //cell = (Grade_detailedTableViewCell*)[[[NSBundle mainBundle] loadNibNamed:@"Grade_detail_ViewController" owner:self options:nil ]objectAtIndex:0];


    NSString *stringForpercent,*stringForassdata,*stringForastype,*stringForduedate,*stringForgraderange,*stringForpointtp,*stringForletter,*stringForsec;
    
    
    for (int i=0; i<ary.count; i++) {
        
        
        if (indexPath.section==i) {
            course_title=[[ary objectAtIndex:i]objectForKey:@"course_title" ];
            NSLog(@"%@",course_title);
            
            grade_array=[[ary objectAtIndex:i]objectForKey:@"gradebook_grade_data"];
            
            stringForpercent= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"PERCENT"];
            stringForpointtp= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"POINTS"];
            //S= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"CATEGORY"];
            //stringForpercent= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"PERCENT"];
            stringForassdata= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"ASSIGNED_DATE"];
            stringForduedate= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"DUE_DATE"];
            
            stringForletter= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"LETTER"];
            
            NSRange r;
           s = stringForletter;
            while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
                s = [s stringByReplacingCharactersInRange:r withString:@""];
            
            
            
            
            stringForgraderange= [[grade_array objectAtIndex:indexPath.row]objectForKey:@"BAR1"];
            stringForastype =[[grade_array objectAtIndex:indexPath.row]objectForKey:@"TITLE"];
            
        }
        
        
        
    }
    
    [cell.percent_lbl setText:stringForpercent];
    [cell.asdata_lbl setText:stringForassdata];
    [cell.pointp_lbl setText:stringForpointtp];
    [cell.duedate_lbl setText:stringForduedate];
    [cell.letter_lbl setText:s];
    [cell.grdrang_lbl setText:stringForgraderange];
     [cell.astype_lbl setText:stringForastype];
    
    
  
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, tableView.frame.size.width,18)];
   // [label setFont:[UIFont boldSystemFontOfSize:11]];
    
    [label setFont:[UIFont fontWithName:@"OpenSans-bold" size:11]];
    
    label.textColor=[UIColor colorWithRed:16/255.0 green:149/255.0 blue:77/255.0 alpha:1.0];
    
    NSString *string =[g_ary objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    //[view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}


-(IBAction)home:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StudentDashboard" bundle: nil];
    SdashboardViewController * sd = [storyboard instantiateViewControllerWithIdentifier:@"studentdash"];
    
    [self.navigationController pushViewController:sd animated:NO];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
