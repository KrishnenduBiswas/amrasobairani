//
//  EditReqstViewController.m
//  openSiS
//
//  Created by os4ed on 4/27/16.
//  Copyright © 2016 openSiS. All rights reserved.
//

#import "P_EditReqstViewController.h"
#import "P_Add_requestViewController.h"
#import "AppDelegate.h"
#import "ip_url.h"
#import "pdashboardViewController.h"
#import "P_RequestViewController.h"
#import "P_SettingViewController.h"
#import "S_ReportViewController.h"
#import "P_SettingViewController.h"
#import "pdashboardViewController.h"
#import "pdashboardViewController.h"
#import "P_msg1.h"
#import "P_SettingViewController.h"

@interface P_EditReqstViewController ()
{
    
    
    NSString    * student_id,*view_select,*s_year,*s_year_id ,*mp_id ,*action_type ,*mpid ,*mpstr ,*strt_c;
    
    IBOutlet UITextField * txt_sub,* txt_course,*txt_withtchr,*wthoutTchr,*onprd,*notonprd;
    
    
    NSMutableArray *mp_title ,*mp_data_id;
    
    
    NSMutableArray *mp_ary,*aryadd,*aryadd2,*tchrdata,*prddata;
    
    
    UIPickerView * selectcustomerpicker;
    
    NSString * str,*str2;
    
    NSString *strC3,*strC4,*strC5,*strC6;
    NSString * sub,*course,*wthtchr,*wthouttchr,*onprdstr,*notprdstr;
    NSString * subt,*courset,*wthtchrt,*wthouttchrt,*onprdstrt,*notprdstrt;
    
    
    
    NSString    *parentid;

    
}

@end

@implementation P_EditReqstViewController


-(IBAction)home:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ParentStoryboard" bundle: nil];
    pdashboardViewController * sd = [storyboard instantiateViewControllerWithIdentifier:@"pdash"];
    
    [self.navigationController pushViewController:sd animated:NO];
    
    
    
    
}
-(IBAction)thirdButton:(id)sender
{
    NSLog(@"Third Button");
}

#pragma mark---Msg
-(IBAction)msg:(id)sender
{
    UIStoryboard * sb=[UIStoryboard storyboardWithName:@"P_msg" bundle:nil];
    P_msg1 * mvc=[[P_msg1 alloc]init];
    mvc=[sb instantiateViewControllerWithIdentifier:@"p_msg1"];
    [self.navigationController pushViewController:mvc animated:NO];
}
#pragma mark—Settings
-(IBAction)settings:(id)sender{
    UIStoryboard * sb=[UIStoryboard storyboardWithName:@"P_Settings" bundle:nil];
    P_SettingViewController * mvc=[[P_SettingViewController alloc]init];
    mvc=[sb instantiateViewControllerWithIdentifier:@"p_Setting"];
    [self.navigationController pushViewController:mvc animated:NO];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //    txt_sub.text=[self.dicttt objectForKey:@"TITLE"];
    //    txt_course.text=[self.dicttt objectForKey:@"TITLE"];
    //    txt_withtchr.text=[self.dicttt objectForKey:@"NAME"];
    //    wthoutTchr.text=[self.dicttt objectForKey:@"NAME"];
    //    onprd.text=[self.dicttt objectForKey:@"TITLE"];
    //    notonprd.text=[self.dicttt objectForKey:@"TITLE"];
    //
    
    
    [self courseperiod123];
    
    
    [self courseperiod1234];
    
    [self pickernotonprd];
    [self pickeronprd];
    [self pickerwithtchr];
    [self pickerwithouttchr];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)courseperiod123{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=60;
    txt_sub.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked1)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    txt_sub.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}














-(void)courseperiod1234{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=61;
    txt_course.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked2)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    txt_course.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}





-(void)pickernotonprd{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=65;
    notonprd.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked6)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    notonprd.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}
-(void)pickerwithtchr{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=62;
    txt_withtchr.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked3)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    txt_withtchr.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}
-(void)pickerwithouttchr{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=63;
    wthoutTchr.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked4)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    wthoutTchr.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}
-(void)pickeronprd{
    
    selectcustomerpicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    selectcustomerpicker.delegate = self;
    
    selectcustomerpicker.dataSource = self;
    
    [ selectcustomerpicker  setShowsSelectionIndicator:YES];
    selectcustomerpicker.tag=64;
    onprd.inputView = selectcustomerpicker;
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked5)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    onprd.inputAccessoryView = mypickerToolbar;
    
    
    
    
    
    
}





-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadedit
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    
    //student_id=[DF objectForKey:@"std_name"];
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"selected_student"]];
    
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    parentid=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STAFF_ID"]];
    
    mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/parent/parent_schedule_request.php?action=edit_view&student_id=%@&syear=%@&req_id=%@",student_id,s_year,_strrrrrrr];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary2=[[NSMutableDictionary alloc]init];
        dictionary2 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary2);
        
        
        
        
        // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary2 objectForKey:@"success"]];
        NSLog(@"str_123-----%@",str_123);
        if([str_123 isEqualToString:@"1"])
            
            
            
        {
            
            aryadd=[dictionary2 objectForKey:@"subject_data"];
            aryadd2=[dictionary2 objectForKey:@"course_data"];
            tchrdata=[dictionary2 objectForKey:@"teacher_data"];
            prddata=[dictionary2 objectForKey:@"period_data"];
            
            sub=(NSString*)[dictionary2 objectForKey:@"selected_subject"];
            course=(NSString*)[dictionary2 objectForKey:@"selected_course"];
            wthtchr=(NSString*)[dictionary2 objectForKey:@"selected_with_teacher"];
            wthouttchr=(NSString*)[dictionary2 objectForKey:@"selected_not_teacher"];
            onprdstr=(NSString*)[dictionary2 objectForKey:@"selected_with_period"];
            notprdstr=(NSString*)[dictionary2 objectForKey:@"selected_not_period"];
            
            
            NSLog(@">>>>>>>subject_data%@",aryadd);
            NSLog(@">>>>>>>course_data%@",aryadd2);
            NSLog(@">>>>>>>teacher_data%@",tchrdata);
            NSLog(@">>>>>>>period_data%@",prddata);
            
            
            
            for (int i=0; i<aryadd.count; i++) {
                if ([sub isEqual:[NSString stringWithFormat:[[aryadd objectAtIndex:i]objectForKey:@"SUBJECT_ID"]]]) {
                    
                    
                    subt=(NSString*)[[aryadd objectAtIndex:i]objectForKey:@"TITLE"];
                    
                    NSLog(@"matched title%@",subt);
                    
                }
                else
                {
                    subt=@"N/A";
                }
                
            }
            
            
            
            for (int i=0; i<aryadd2.count; i++) {
                if ([course isEqual:[NSString stringWithFormat:[[aryadd2 objectAtIndex:i]objectForKey:@"COURSE_ID"]]]) {
                    
                    
                    courset=(NSString*)[[aryadd2 objectAtIndex:i]objectForKey:@"TITLE"];
                    
                    NSLog(@"matched title%@",courset);
                    
                }
                else
                {
                    courset=@"N/A";
                }
                
            }
            
            
            
            
            
            
            
            
            for (int i=0; i<tchrdata.count; i++) {
                if ([wthtchr isEqual:[NSString stringWithFormat:[[tchrdata objectAtIndex:i]objectForKey:@"TEACHER_ID"]]]) {
                    
                    
                    wthtchrt=(NSString*)[[tchrdata objectAtIndex:i]objectForKey:@"NAME"];
                    
                    NSLog(@"matched title%@",wthtchrt);
                    
                }
                else
                {
                    wthtchrt=@"N/A";
                }
                
            }
            
            for (int i=0; i<tchrdata.count; i++) {
                if ([wthouttchr isEqual:[NSString stringWithFormat:[[tchrdata objectAtIndex:i]objectForKey:@"TEACHER_ID"]]]) {
                    
                    
                    wthouttchrt=(NSString*)[[tchrdata objectAtIndex:i]objectForKey:@"NAME"];
                    
                    NSLog(@"matched title%@",wthouttchrt);
                    
                }
                else
                {
                    wthouttchrt=@"N/A";
                }
                
            }
            for (int i=0; i<prddata.count; i++) {
                if ([onprdstr isEqual:[NSString stringWithFormat:[[prddata objectAtIndex:i]objectForKey:@"PERIOD_ID"]]]) {
                    
                    
                    onprdstrt=(NSString*)[[prddata objectAtIndex:i]objectForKey:@"TITLE"];
                    
                    NSLog(@"matched title%@",onprdstrt);
                    
                }
                else
                {
                    onprdstrt=@"N/A";
                }
                
            }
            for (int i=0; i<prddata.count; i++) {
                if ([notprdstr isEqual:[NSString stringWithFormat:[[prddata objectAtIndex:i]objectForKey:@"PERIOD_ID"]]]) {
                    
                    
                    notprdstrt=(NSString*)[[prddata objectAtIndex:i]objectForKey:@"TITLE"];
                    
                    NSLog(@"matched title%@",notprdstrt);
                    
                }
                else
                {
                    notprdstrt=@"N/A";
                }
                
            }
            
            [self textadd];
            
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
}






- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    return 1;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if (pickerView.tag==60)
    {
        
        return aryadd.count;
    }
    if (pickerView.tag==61)
    {
        
        return aryadd2.count;
    }
    if (pickerView.tag==62)
    {
        
        return tchrdata.count;
    }
    if (pickerView.tag==63)
    {
        
        return tchrdata.count;
    }
    if (pickerView.tag==64)
    {
        
        return prddata.count;
    }
    if (pickerView.tag==65)
    {
        
        return prddata.count;
    }
    
    return 0;
    
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    if (pickerView.tag==60)
    {
        return [[aryadd objectAtIndex:row]objectForKey:@"TITLE"];
    }
    
    if (pickerView.tag==61)
    {
        return [[aryadd2 objectAtIndex:row]objectForKey:@"TITLE"];
    }
    if (pickerView.tag==62)
    {
        return [[tchrdata objectAtIndex:row]objectForKey:@"NAME"];
    }
    if (pickerView.tag==63)
    {
        return [[tchrdata objectAtIndex:row]objectForKey:@"NAME"];
    }
    if (pickerView.tag==64)
    {
        return [[prddata objectAtIndex:row]objectForKey:@"TITLE"];
    }
    if (pickerView.tag==65)
    {
        return [[prddata objectAtIndex:row]objectForKey:@"TITLE"];
    }
    
    
    //
    return 0;
    
    
    
}









-(void)loadsub
{
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    
    //student_id=[DF objectForKey:@"std_name"];
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"selected_student"]];
    
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    parentid=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STAFF_ID"]];
    
    mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/parent/parent_schedule_request.php?action=add_view&student_id=%@&syear=%@&subject_id=%@",student_id,s_year,str];

    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary2=[[NSMutableDictionary alloc]init];
        dictionary2 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary2);
        
        
        
        
        // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary2 objectForKey:@"success"]];
        NSLog(@"str_123-----%@",str_123);
        if([str_123 isEqualToString:@"1"])
            
            
            
        {
            
            
            
            
            aryadd2=[dictionary2 objectForKey:@"course_data"];
            
            
            NSLog(@"aryadd----%@",aryadd2);
            
            
            
            [self textfieldadddata];
            [self textfieldadddata2];
            
            
            
            
            
            
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
}


-(void)loadcourse
{
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    
    //student_id=[DF objectForKey:@"std_name"];
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"selected_student"]];
    
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    parentid=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STAFF_ID"]];
    
    mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/parent/parent_schedule_request.php?action=add_view&student_id=%@&syear=%@&subject_id=%@&course_id=%@",student_id,s_year,str,str2];
    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary2=[[NSMutableDictionary alloc]init];
        dictionary2 = (NSMutableDictionary *)responseObject;
        NSLog(@"value is-------%@",dictionary2);
        
        
        
        
        // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary2 objectForKey:@"success"]];
        NSLog(@"str_123-----%@",str_123);
        if([str_123 isEqualToString:@"1"])
            
            
            
        {
            
            tchrdata=[dictionary2 objectForKey:@"teacher_data"];
            prddata=[dictionary2 objectForKey:@"period_data"];
            
            
            NSLog(@"teacher%@",tchrdata);
            NSLog(@"period%@",prddata);
            
            
            [self textfieldadddata2];
            
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
}



- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    
    
    if (pickerView.tag==60) {
        
        txt_sub.text=(NSString *)[[aryadd objectAtIndex:row]objectForKey:@"TITLE"];
        
        
        NSString *strC1 =(NSString *)[[aryadd objectAtIndex:row]objectForKey:@"SUBJECT_ID"];
        
        NSLog(@"ppppppppiooo%@",strC1);
        str=strC1;
        
        
        
        [self loadsub];
        
        [self courseperiod1234];
        
    }
    if (pickerView.tag==61) {
        
        txt_course.text=(NSString *)[[aryadd2 objectAtIndex:row]objectForKey:@"TITLE"];
        
        
        NSString *strC12 =(NSString *)[[aryadd2 objectAtIndex:row]objectForKey:@"COURSE_ID"];
        
        NSLog(@"ppppppppiooo%@",strC12);
        
        
        str2=strC12;
        
        
        
        [self pickernotonprd];
        [self pickeronprd];
        [self pickerwithtchr];
        [self pickerwithouttchr];
        
        
        
        [self loadcourse];
        
        
    }
    if (pickerView.tag==62) {
        
        txt_withtchr.text=(NSString *)[[tchrdata objectAtIndex:row]objectForKey:@"NAME"];
        
        
        strC3 =(NSString *)[[tchrdata objectAtIndex:row]objectForKey:@"TEACHER_ID"];
        NSLog(@"ppppppppiooo%@",strC3);
        //        str=strC1;
        
    }
    
    if (pickerView.tag==63) {
        
        wthoutTchr.text=(NSString *)[[tchrdata objectAtIndex:row]objectForKey:@"NAME"];
        
        
        strC4 =(NSString *)[[tchrdata objectAtIndex:row]objectForKey:@"TEACHER_ID"];
        NSLog(@"ppppppppiooo%@",strC4);
        //        str=strC1;
        
    }
    
    if (pickerView.tag==64) {
        
        onprd.text=(NSString *)[[prddata objectAtIndex:row]objectForKey:@"TITLE"];
        
        strC5 =(NSString *)[[prddata objectAtIndex:row]objectForKey:@"PERIOD_ID"];
        NSLog(@"ppppppppiooo%@",strC5);
        //        str=strC1;
        
    }
    if (pickerView.tag==65) {
        
        notonprd.text=(NSString *)[[prddata objectAtIndex:row]objectForKey:@"TITLE"];
        
        strC6 =(NSString *)[[prddata objectAtIndex:row]objectForKey:@"PERIOD_ID"];
        NSLog(@"ppppppppiooo%@",strC6);
        //        str=strC1;
        
    }
    
    
    
    
    
}
-(void)pickerDoneClicked1

{
    NSLog(@"Done Clicked");
    
    [txt_sub resignFirstResponder];
    
    
    
    
    
    
    
    
    
}

-(void)pickerDoneClicked2

{
    NSLog(@"Done Clicked");
    
    
    
    [txt_course resignFirstResponder];
    
    
    
    
}
-(void)pickerDoneClicked3

{
    NSLog(@"Done Clicked");
    
    [txt_withtchr resignFirstResponder];
    
    
}
-(void)pickerDoneClicked4

{
    NSLog(@"Done Clicked");
    
    [wthoutTchr resignFirstResponder];
    
    
}
-(void)pickerDoneClicked5

{
    NSLog(@"Done Clicked");
    
    [onprd resignFirstResponder];
    
    
}
-(void)pickerDoneClicked6

{
    NSLog(@"Done Clicked");
    
    [notonprd resignFirstResponder];
    
    
}







-(void)textadd
{
    
    
    txt_sub.text=subt;
    txt_course.text=courset;
    txt_withtchr.text=wthtchrt;
    wthoutTchr.text=wthouttchrt;
    onprd.text=onprdstrt;
    notonprd.text=notprdstrt;
    
}


-(void)textfieldadddata
{
    
    txt_course.text=[[aryadd2 objectAtIndex:0]objectForKey:@"TITLE"];
    
    
}
-(void)textfieldadddata2
{
    
    txt_withtchr.text=[[tchrdata objectAtIndex:0]objectForKey:@"NAME"];
    wthoutTchr.text=[[tchrdata objectAtIndex:0]objectForKey:@"NAME"];
    onprd.text=[[prddata objectAtIndex:0]objectForKey:@"TITLE"];
    notonprd.text=[[prddata objectAtIndex:0]objectForKey:@"TITLE"];
    
    
}



-(void)loadreqst1
{
    
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *DF=[NSUserDefaults standardUserDefaults];
    
    //student_id=[DF objectForKey:@"std_name"];
    student_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"selected_student"]];
    
    s_year_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SCHOOL_ID"]];
    s_year=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"SYEAR"]];
    parentid=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"STAFF_ID"]];
    
    mp_id=[NSString stringWithFormat:@"%@",[appDelegate.dic objectForKey:@"UserMP"]];
    
    ip_url *obj123=[[ip_url alloc]init];
    NSString *str123=[obj123 ipurl];
    NSString*str_checklogin=[NSString stringWithFormat:@"/parent/parent_schedule_request.php?action=add_submit&student_id=%@&syear=%@&subject_id=%@&course_id=%@&with_teacher_id=%@&not_teacher_id=%@&with_period_id=%@&not_period_id=%@&mp_id=%@",student_id,s_year,str,str2,strC3,strC4,strC5,strC6,mp_id];    NSLog(@"kkkkkkkkkkk%@",str_checklogin);
    NSString *url12=[NSString stringWithFormat:@"%@%@",str123,str_checklogin];
    
    NSLog(@"----%@",url12);
    NSURL *url = [NSURL URLWithString:url12];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; // Add korlam bcoz sob content type support korena
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *  dictionary2=[[NSMutableDictionary alloc]init];
        dictionary2 = (NSMutableDictionary *)responseObject;
        NSLog(@"Edit value is-------%@",dictionary2);
        
        
        
        
        // ei khanei nslog korle dekhache, blocker baire dekhache na
        //    NSUserDefaults *obj12=[NSUserDefaults standardUserDefaults];
        
        //  [obj12  setValue:dictionary1  forKey:@"profile_data"];
        NSString *str_123=[NSString stringWithFormat:@"%@",[dictionary2 objectForKey:@"success"]];
        NSLog(@"str_123-----%@",str_123);
        if([str_123 isEqualToString:@"1"])
            
            
            
        {
            P_RequestViewController *obj1 =[[P_RequestViewController alloc]init];
            UIStoryboard *sb=[UIStoryboard storyboardWithName:@"P_Schedule" bundle:nil];
            obj1=[sb instantiateViewControllerWithIdentifier:@"p_rqst"];
            [self.navigationController pushViewController:obj1 animated:YES];

            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //  transparentView.hidden=NO;
        //  NSLog(@"ok----");
        //[self.view addSubview:transparentView];
    }];
    
    
    [operation start];
    
    
}





-(IBAction)addreqst:(id)sender
{
    
    [self loadreqst1];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"P_Schedule" bundle: nil];
    P_RequestViewController * rqstvc=[[P_RequestViewController alloc]init];
    rqstvc=[storyboard instantiateViewControllerWithIdentifier:@"p_rqst"];
    [self.navigationController pushViewController:rqstvc animated:YES];

    
    
    
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

