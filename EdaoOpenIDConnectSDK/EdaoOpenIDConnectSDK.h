//
//  EdaoOpenIDConnectSDK.h
//  EdaoOpenIDConnectSDK
//
//  Created by 李嘉鑫 on 14-8-19.
//  Copyright (c) 2014年 李嘉鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    EdaoOIDConnErrorCode_Success = 0, //成功
    
    EdaoOIDConnErrorCode_Cancel = 10002, //用户取消
    EdaoOIDConnErrorCode_NetWork = 10003, //网络问题
    
    EdaoOIDConnErrorCode_ARG = 20001, //登录传入参数格式错误或缺失
    
    EdaoOIDConnErrorCode_UNKnow = -99999//未知错误
} EdaoOIDConnErrorCode;

@protocol EdaoOpenIDConnectDelegate <NSObject>

@required

/**
 *	@brief	翼道登录操作返回结果
 *
 *	@param 	result 	登录结果
 */
-(void)edaoOpenIDConnectDidLoginResult:(NSDictionary*)result;

@end

@interface EdaoOpenIDConnectSDK : NSObject

/**
 *	@brief	翼道OpenIDConnect登录
 *
 *	@param 	clientName 	翼道为企业用户开户时指定的的用户标识,此标识与网关广告挂钩,对接后翼道会由技术专门生成相应的标识，替换默认值即可
 *	@param 	callBack 	登录后返回地址
 *	@param 	credentials 获取客户分派的证书信息
 *	@param 	delegate 	登录结果回调对象
 */
+(void)clientName:(NSString*)clientName callBack:(NSString*)callBack credentials:(NSString*)credentials delegate:(id<EdaoOpenIDConnectDelegate>)delegate;

/**
 *	@brief	处理Edao App登录回调
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
+ (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
