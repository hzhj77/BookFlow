 //
//  PostBookViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "PostBookViewController.h"

@interface PostBookViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UITextViewDelegate>

@end

@implementation PostBookViewController {
    UIButton *_addCoverBtn;
    UIImageView *_coverImgV;
    UIImage *_cover;
    CAShapeLayer *border;
    UITextField *_title;
    UIView *_line1;
    UITextField *_author;
    UIView *_line2;
    UITextView *_intro;
    UIView *_line3;
    UITextView *_comment;
    BOOL isShowCover;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发布漂流";
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"more"]
                           forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(post)forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 30, 20);
    
    UIBarButtonItem *rMenuButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rMenuButton;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:ScreenFrame];
    scrollView.contentSize = ScreenFrame.size;
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    UIButton *_addCoverBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 14, ScreenWidth - 40, 100)];
    [_addCoverBtn setTitle:@"+添加封面" forState:UIControlStateNormal];
    [_addCoverBtn addTarget:self action:@selector(addCover) forControlEvents:UIControlEventTouchUpInside];
    [_addCoverBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    border = [CAShapeLayer layer];
    border.strokeColor = [UIColor lightGrayColor].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:_addCoverBtn.bounds].CGPath;
    border.frame = _addCoverBtn.bounds;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@4, @2];
    [_addCoverBtn.layer addSublayer:border];
    [scrollView addSubview:_addCoverBtn];
    
    _coverImgV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 - 75, 14, 150, 200)];
    [scrollView addSubview:_coverImgV];
    
    _title = [[UITextField alloc]initWithFrame:CGRectZero];
    _title.placeholder = @"书名";
    _title.font = [UIFont boldSystemFontOfSize:19];
    [scrollView addSubview:_title];
    
    _line1 = [[UIView alloc]initWithFrame:CGRectZero];
    _line1.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:_line1];
    
    _author = [[UITextField alloc]initWithFrame:CGRectZero];
    _author.placeholder = @"作者";
    [scrollView addSubview:_author];
    
    _line2 = [[UIView alloc]initWithFrame:CGRectZero];
    _line2.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:_line2];
    
    _intro = [[UITextView alloc]initWithFrame:CGRectZero];
    _intro.text = @"简介（40字以内）";
    _intro.textColor = [UIColor grayColor];
    _intro.font = [UIFont systemFontOfSize:14];
    _intro.delegate = self;
    [scrollView addSubview:_intro];
    

    
    _comment = [[UITextView alloc]initWithFrame:CGRectZero];
    _comment.text = @"说出这本书和你的故事吧~";
    _comment.textColor = [UIColor grayColor];
    _comment.font = [UIFont systemFontOfSize:14];
    _comment.delegate = self;
    _comment.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _comment.layer.borderWidth = 0.5;
    _comment.layer.cornerRadius = 5;
    _comment.layer.masksToBounds = YES;
    [scrollView addSubview:_comment];
    
    [self showAddButton];
}

- (void)post {
    
}

- (void)showAddButton {
    isShowCover = NO;
    border.strokeColor = [UIColor lightGrayColor].CGColor;
    _addCoverBtn.alpha = 1;
    _coverImgV.alpha = 0;
    _title.frame = CGRectMake(20, 140, ScreenWidth - 40, 30);
    _line1.frame = CGRectMake(20, 170, ScreenWidth - 40, 0.5);
    _author.frame = CGRectMake(20, 183, ScreenWidth - 40, 25);
    _line2.frame = CGRectMake(20, 210, ScreenWidth - 40, 0.5);
    _intro.frame = CGRectMake(20, 213, ScreenWidth - 40, 50);
    
    _comment.frame = CGRectMake(20, 330, ScreenWidth - 40, 200);
}

- (void)showCover {
    isShowCover = YES;
    border.strokeColor = [UIColor whiteColor].CGColor;
    _addCoverBtn.alpha = 0;
    _coverImgV.alpha = 1;
    _title.frame = CGRectMake(20, 240, ScreenWidth - 40, 30);
    _line1.frame = CGRectMake(20, 270, ScreenWidth - 40, 0.5);
    _author.frame = CGRectMake(20, 273, ScreenWidth - 40, 25);
    _line2.frame = CGRectMake(20, 310, ScreenWidth - 40, 0.5);
    _intro.frame = CGRectMake(20, 313, ScreenWidth - 40, 50);
    _comment.frame = CGRectMake(20, 430, ScreenWidth - 40, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCover {
    if (isShowCover) {
        return;
    }
    UIActionSheet *sheet;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sheet = [[UIActionSheet alloc]initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    } else {
        sheet = [[UIActionSheet alloc]initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    [sheet showInView:self.view];
}

#pragma mark - <UIActionSheetDelegate>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSInteger sourceType = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 0:
            
                return;
                
            case 1:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
                
            case 2:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
            default:
                break;
        }
    } else {
        if (buttonIndex == 0) {
            return;
        } else {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    
    UIImagePickerController *imgPickCtl = [[UIImagePickerController alloc] init];
    imgPickCtl.delegate = self;
    imgPickCtl.sourceType = sourceType;
    [self presentViewController:imgPickCtl animated:YES completion:^{
        
    }];
}

#pragma mark - <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    _cover = [info objectForKey:UIImagePickerControllerOriginalImage];
    _coverImgV.image = _cover;
    [self showCover];
}

#pragma mark - <UITextViewDelegate>
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == _comment) {
        if(textView.text.length < 1){
            textView.text = @"说出这本书和你的故事吧~";
            textView.textColor = [UIColor grayColor];
        }
    } else {
        if(textView.text.length < 1){
            textView.text = @"简介（40字以内）";
            textView.textColor = [UIColor grayColor];
        }
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == _comment) {
        if([textView.text isEqualToString:@"说出这本书和你的故事吧~"]){
            textView.text=@"";
            textView.textColor=[UIColor blackColor];
        }

    } else {
        if([textView.text isEqualToString:@"简介（40字以内）"]){
            textView.text=@"";
            textView.textColor=[UIColor blackColor];
        }
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView == _intro) {
        NSString *toBeString = textView.text;
        UITextRange *selectedRange = [textView markedTextRange];
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
        if (!position){
            if (toBeString.length > 10){
                //中文和emoj表情存在问题，需要对此进行处理
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 10)];
                textView.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}


@end
