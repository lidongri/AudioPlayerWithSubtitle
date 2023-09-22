//
//  NSObject+SwitchCase.h
//  BlueWhaleProject
//
//  Created by 李雪健 on 2021/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^KJCaseBlock)(void);

@interface NSObject (SwitchCase)

/// 支持NSCoping协议的数据可以用此方法实现switch+case操作
/// @param cases 数据集合
- (void)switchInCases:(NSDictionary <id <NSCopying>, KJCaseBlock> *)cases;

/// 支持NSCoping协议的数据可以用此方法实现switch+case操作 默认值
/// @param cases 数据集合
/// @param defaultBlock 默认值
- (void)switchInCases:(NSDictionary <id <NSCopying>, KJCaseBlock> *)cases withDefault:(nullable KJCaseBlock)defaultBlock;

@end

NS_ASSUME_NONNULL_END
