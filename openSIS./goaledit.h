//
//  MyInformationCertification.h
//  openSiS
//
//  Created by os4ed on 1/11/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  goaledit: UIViewController

{
    NSString *STAFF_ID_K;
    IBOutlet UILabel *calendar_name,*rolling;
    IBOutlet UIView *view_upper;
    NSString *edit_flag;
    
    NSString *comment_id;
    IBOutlet UIButton *btn_add,*btn_close;
    
    IBOutlet UIView *view_header;
    
    
    IBOutlet UITextField *lbl_hidden;
    
    IBOutlet UILabel *notofi,*msg_count_tab;
    IBOutlet UILabel *msg_count;

}
@property(strong,nonatomic)NSString *studentID,*studentName;
@property(strong,nonatomic)NSString *date_string,*end_date;
@property(strong,nonatomic)NSString *str_txt_view;
@property(strong,nonatomic)NSString *goal_title,*GOAL_ID;
@end
