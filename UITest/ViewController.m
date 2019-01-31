//
//  ViewController.m
//  UITest
//
//  Created by tianyou_ios on 2019/1/4.
//  Copyright © 2019 tianyou_ios. All rights reserved.
//

#import "ViewController.h"
#import "UI/loginViewController.h"
#import "UI/registerViewController.h"
#import "UI/forgetPswViewController.h"
#import "Encryption.h"

#define  SCREENSCALEWIDTH 1000/1080
#define  SCREENSCALEHEIGHT 200/1920
#define  SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define  SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

@interface ViewController ()
@property (nonatomic)UIButton *btnLogin;
@property (nonatomic)UIButton *btnRegister;
@end

@implementation ViewController

- (void)viewDidLoad {
   
//    _btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
//    _btnLogin=[[UIButton alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 100)];
//    [_btnLogin setBackgroundColor:[UIColor blueColor]];
//    [_btnLogin  setTitle:@"login" forState:UIControlStateNormal];
////    [_btnLogin addTarget:self action:@selector(JumpToLoginView:) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:_btnLogin];
    
    _btnRegister=[UIButton buttonWithType:UIButtonTypeCustom];
    _btnRegister=[[UIButton alloc]initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 100)];
    [_btnRegister setBackgroundColor:[UIColor grayColor]];
    [_btnRegister  setTitle:@"register" forState:UIControlStateNormal];
    [_btnRegister addTarget:self action:@selector(JumpToRegisterView:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_btnRegister];
}


//-(void)JumpToLoginView:(id)sender
//{
//    loginViewController *loginControllView=[[loginViewController alloc]init];
//    self.definesPresentationContext =YES;
//    loginControllView.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self presentViewController:loginControllView  animated:YES completion:^{
//        UIColor *color= [UIColor blackColor];
//        loginControllView.view.backgroundColor = [color colorWithAlphaComponent:0.5];
//    }];
//}

-(void)JumpToRegisterView:(id)sender
{
    [self demo4];
}

//-(void)demo3{
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://45.249.246.198:30009/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@",json);
//    }];
//    [dataTask resume];
//
//}
-(void)demo4{
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.userInteractionEnabled=YES;
//    UIStoryboard *storyB= [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    id mainViewController = [storyB instantiateViewControllerWithIdentifier:@"MainView"];
//    [self presentViewController:mainViewController animated:YES completion:nil];
    [self.view addSubview:[self successView]];
}
-(UIView *)successView
{
    UIView *vc=[[UIView alloc]init];
    
    [vc setBackgroundColor:[UIColor greenColor]];
    [vc setAlpha:0.8];
    
    
    UILabel *label=[[UILabel alloc]init];
    label.bounds=CGRectMake(0, 0, vc.bounds.size.width,vc.bounds.size.height/4);
    label.center=CGPointMake(vc.frame.size.width/2, vc.frame.size.height/2);
    label.text=[NSString stringWithFormat:@"欢迎，小样"];
    [vc addSubview:label];
    
    UILabel *labelSwitchUsers=[[UILabel alloc]init];
    labelSwitchUsers.bounds=CGRectMake(0, 0, 10, 10);
    labelSwitchUsers.center=CGPointMake(vc.frame.size.width/2, vc.frame.size.height/2);
    labelSwitchUsers.textColor=[UIColor blueColor];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"切换账号"];
    //label添加文本下划线
    [labelSwitchUsers setLineBreakMode:NSLineBreakByWordWrapping];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    //label添加文本
    labelSwitchUsers.attributedText = content;
    //label添加点击事件
    UITapGestureRecognizer *labelGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(switchUser:)];
    [labelSwitchUsers setUserInteractionEnabled:YES];
    [labelSwitchUsers addGestureRecognizer:labelGesture];
    [vc addSubview:labelSwitchUsers];
    
    return vc;
}
-(void)switchUser:(id)sender{
    NSLog(@"df");
}
//-(void)uploadBodyTransform{
//    //c传参成字典
//    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
//    [params setValue:@"dq" forKey:@"AppID" ];
//    [params setValue:@"344534"forKey:@"AccountId" ];
//    [params setValue:@"334553234" forKey:@"RoleId" ];
//    [params setValue:@"89.34.9.8" forKey:@"ServerID" ];
//    [params setValue:@"iPhoneX" forKey:@"Pdevice" ];
//    [params setValue:@"dadaccxdc" forKey:@"RoleName" ];
//    NSLog(@"\nParams:%@",params);
//
//    //升序排序key,拼接
//    //获取字典的所有keys
//    NSArray * keys = [params allKeys];
//    NSArray *sortArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        return [obj1 compare:obj2 options:NSNumericSearch];
//    }];
//    NSMutableArray *valueArray = [NSMutableArray array];
//    for (NSString *sortString in sortArray) {
//        [valueArray addObject:[params objectForKey:sortString]];
//    }
//    NSMutableArray *signArray = [NSMutableArray array];
//    for (int i = 0; i < sortArray.count; i++) {
//        NSString *keyValueStr = [NSString stringWithFormat:@"%@:%@",sortArray[i],valueArray[i]];
//        [signArray addObject:keyValueStr];
//    }
//    NSMutableString *URL=[signArray componentsJoinedByString:@"&"];
//    NSLog(@"\nConnectChanged Params：\n%@",URL);
//
//    //字典json化
//    NSError *parseError= nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&parseError];
//    NSLog(@"\njsonChanged Params：%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
//    //拼接后的字符串加密
//    NSData *data= [URL dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"\nBase64Changed Params：%@",[data base64EncodedStringWithOptions:0]);
//
//    //MD5
//    NSString *secret=@"f8jfa9jg49h4rktk";
//    [URL appendString:secret];
//    NSString *doo=[Encryption md5EncryptWithString:URL];
//    NSLog(@"addKey：%@",URL);
//    NSLog(@"EnableCode：%@",doo);
//
//    //要发送的是
//    NSString *string=[NSString stringWithFormat:@"&signature="];
//    [URL appendString:string];
//    [URL appendString:doo];
//    NSLog(@"要发送的是\n%@",URL);
//}
//
//
//
//
//-(void)demo{
//    //访问百度首页
//
//    //1. 创建一个网络请求
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//
//    //2.创建请求对象
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    //3.获得会话对象
//    NSURLSession *session=[NSURLSession sharedSession];
//
//    //4.根据会话对象创建一个Task(发送请求）
//    /*
//     第一个参数：请求对象
//     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
//     data：响应体信息（期望的数据）
//     response：响应头信息，主要是对服务器端的描述
//     error：错误信息，如果请求失败，则error有值
//     */
//    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        //response ： 响应：服务器的响应
//        //data：二进制数据：服务器返回的数据。（就是我们想要的内容）
//        //error：链接错误的信息
//        NSLog(@"网络响应：response：%@",response);
//
//        //根据返回的二进制数据，生成字符串！NSUTF8StringEncoding：编码方式
//        NSString *html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//
//        //在客户端直接打开一个网页！
//        //客户端服务器：UIWebView
//
//        //将浏览器加载到view上
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            //实例化一个客户端浏览器
////            UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
//            UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
//            //加载html字符串：baseURL：基准的地址：相对路径/绝对路径
//            [web loadHTMLString:html baseURL:nil];
//            [self.view addSubview:web];
//
//        });
//
//        //        //在本地保存百度首页
//        //        [data writeToFile:@"/Users/Liu/Desktop/baidu.html" atomically:YES];
//
//    }
//                                    ];
//
//    //5.执行任务
//    [dataTask resume];
//}
//-(void)demo2{
//    //post方法
//    //1.创建会话对象
//    NSURLSession *session=[NSURLSession sharedSession];
//
//    //2.根据会话对象创建task
//    NSURL *url=[NSURL URLWithString:@"http://45.249.246.198:30009/"];
//
//    //3.创建可变的请求对象
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//
//    //4.修改请求方法为POST
//    request.HTTPMethod=@"POST";
//
//    //5.设置请求体
//    request.HTTPBody=[@"Login=1" dataUsingEncoding:NSUTF8StringEncoding];
//
//    //6.根据会话对象创建一个Task(发送请求）
//    /*
//     第一个参数：请求对象
//     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
//     data：响应体信息（期望的数据）
//     response：响应头信息，主要是对服务器端的描述
//     error：错误信息，如果请求失败，则error有值
//     */
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
//
//        //8.解析数据
//        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@",dict);
//    }];
//
//    //7.执行任务
//    [dataTask resume];
//
//}
@end
