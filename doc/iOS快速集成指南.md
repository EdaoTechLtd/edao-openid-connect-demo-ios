iOS快速集成指南 - 翼道 EdaoOpenIDConnectSDK
---
---
目录

  - 第一步：将SDK导入到你的工程中
  - 第二步：配置到AppDelegate
  - 第三步：添加URL Types
  - 第四步：使用SDK进行授权登录

第一步：将SDK导入到你的工程中
----

  - 在github上下载EdaoOpenIDConnectSDK最新版本。如果您还尚未下载，请点击这里下载或者访问https://github.com/ 。解压后如下图

  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/1.png)
  
  - 将EdaoOpenIDConnectSDK的框架目录导入到您的工程中
  
  将下载的SDK文件解压，直接拖动EdaoOpenIDConnectSDK目录到工程中，如下图
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/2.png)

  拖到工程中后，弹出以下对话框，勾选"Copy items into destination group's folder(if needed)"，并点击“Finish“按钮, 如图
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/3.png)
  
  导入后最终效果如下图：
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/4.png)
  
  ```sh
  注意：请务必在上述步骤中选择“Create groups for any added folders”单选按钮组。如果你选择“Create folder references for any added folders”，一个蓝色的文件夹引用将被添加到项目并且将无法找到它的资源。
  ```
  
第二步：配置到AppDelegate
----

  - 引入头文件
  
  打开*AppDelegate.m(*代表你的工程名字) 导入文件头EdaoOpenIDConnectSDK.h

  ```sh
  #import "EdaoOpenIDConnectSDK.h"
  ```
  
  - 添加handleOpenURL处理方法，在下面的方法添加如下代码
  
  ```sh
  -(BOOL)application:(UIApplication*)application openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication
{
    return [EdaoOpenIDConnectSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];     
}
  ```
  
第三步：添加URL Types
----

  - 打开URL Types栏,添加URLType
  
  1.点击project文件

  2.点击TARGETS下的App名称
  
  3.点击选项卡"Info"
  
  4.打开选项卡中URL Types栏
  
  5.添加一个URL Type identifier中填入com.EdaoSDK
  
  6.URL Schemes中填入EdaoCusCl-(您通过翼道得到的ClientName,不包括括号),如您得到的ClientName为EdaoStd,则填入EdaoCusCl-EdaoStd 如下图

  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/5.png)
  
第四步：使用EdaoOpenIDConnectSDK进行授权登录
----

  - 在需要使用EdaoOpenIDConnectSDK授权登录的地方引入头文件
  ```sh
  #import "EdaoOpenIDConnectSDK.h"
  ```
  
  - 继承EdaoOpenIDConnectDelegate,如
  ```sh
  @interface UIViewController ()<EdaoOpenIDConnectDelegate>
  ```
  
  - 调用EdaoOpenIDConnectSDK登录方法,传入通过翼道获得的参数
  ```sh
  [EdaoOpenIDConnectSDK clientName:@"您从翼道获得的ClientName" callBack:@"您在翼道设置的Return Url" credentials:@"您从翼道获得的RSA公钥Base64字符串" delegate:self];
  ```
  
  - 继承EdaoOpenIDConnectSDK,实现-(void)edaoOpenIDConnectDidLoginResult:(NSDictionary*)result;方法
  ```sh
  -(void)edaoOpenIDConnectDidLoginResult:(NSDictionary*)result
  {
     NSInteger errorCode = [[result objectForKey:@"errorCode"] integerValue];
     NSString *errorDesc = [[result objectForKey:@"errorDesc"];
     NSString *openid = [[result objectForKey:@"identity"];
  }
  ```
  
  整个流程如EdaoOpenIDConnectSDK Demo中MasterViewController.m文件中,如下图
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/6.png)
  
  - 在EdaoOpenIDConnectSDK Demo下的最终效果,如下图
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/7.png)
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/8.png)
  
  ![Alt text](https://raw.githubusercontent.com/EdaoTechLtd/edao-openid-connect-demo-ios/master/doc/resources/9.png)

  
