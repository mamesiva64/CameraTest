//
//  AppDelegate.m
//  ApplicationManageSample
//
//  Created by KenUchida on 2019/04/09.
//  Copyright © 2019 KenUchida. All rights reserved.
//
/**
 AppDelegate,UIViewController,UIViewのライフサイクル/iOS/Swift
 https://qiita.com/kayo_h/items/4710c4ac02a191652a96
 
 ライフサイクルが変わっている
 https://anz-note.tumblr.com/post/168082885521/ios11%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB%E3%81%8C%E5%A4%89%E3%82%8F%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E4%BB%B6
 
 SwiftでAppDelegateを使った画面間のデータ受け渡し
 https://qiita.com/xa_un/items/814a5cd4472674640f58
 http://youngforever.hatenablog.com/entry/2014/05/13/180651

 -----------------------------
 ObjectiveC 共通変数
 https://iscene.jimdo.com/2015/06/23/objective-c-delegate%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%81%AE%E7%94%BB%E9%9D%A2%E9%96%93%E3%81%AE%E5%80%A4%E3%81%AE%E5%8F%97%E3%81%91%E6%B8%A1%E3%81%97/
 @property (strong, nonatomic)  NSString *globalStrings01;
 
 AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
 

 
 https://nymemo.com/xcode/1021/
 @property (nonatmic, weak) NSString *shareString;

StackOverFlow
 https://ja.stackoverflow.com/questions/12585/os-xviewcontroller%E3%81%8B%E3%82%89appdelegate%E3%81%AB%E5%A4%89%E6%95%B0%E3%81%AE%E5%80%A4%E3%82%92%E6%B8%A1%E3%81%97%E3%81%9F%E3%81%84

 -----------------------------------
プロパティ
 http://south37.hatenablog.com/entry/2014/07/06/Objctive-C%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8Bweak%E5%8F%82%E7%85%A7%E3%81%AE%E4%BD%BF%E3%81%84%E3%81%A9%E3%81%93%E3%82%8D%E3%81%A3%E3%81%A6%E5%88%86%E3%81%8B%E3%82%8A%E3%81%A5%E3%82%89%E3%81%84
 1. アクセス制御
 readonly,readwrite
2. 所有属性
 strongとかweakとかオブジェクトの所有権限を指定する
 所有属性    説明
 strong    オーナーシップを持つ(参照カウントがincrementされる)  デフォルト
 weak    オーナーシップを持たない(参照カウントがincrementされない)。オブジェクトが解放されるとnilを返す様になる。
 copy    コピーに対してオーナーシップを持つ(setterに渡されたオブジェクトのコピーを作るため、元のオブジェクトとは違うオブジェクトを持つ)
 
 retain
 assign
 
 3. アトミックの指定
 atomic, nonatomicとかを指定する事で、複数スレッドをたてて処理を並列化した時に、オブジェクトに対する処理を排他的にするかどうか
 4. アクセサ名の指定
 ゲッタやセッタの名前を自分で決めれる。
  @property (nonatomic, getter=getValue, setter=setValue:) NSInteger hitPoint; // getterとしてgetValue, setterとしてsetValueメソッドを作成!!

 

 [Objective-C]わかりやすいプロパティのnonatomic/strong/copy/retain/assignの意味
https://qiita.com/CodeCoder/items/bd898dcac75261d8b574
 

 Objective-C のプロパティ属性のガイドライン
 https://qiita.com/uasi/items/80660f9aa20afaf671f3#2-2

 [Objective-C] 今さらですが、ARC超入門 (1)
 http://shingohry.com/introduction-to-using-arc/
 ARC (Automatic Reference Counting) とは、
 「自動リファレンスカウンタ」のことです。
 
 
 -----------------------------------
 Realm
https://realm.io/jp/blog/obj-c-swift-2-2-thread-safe-reference-sort-properties-relationships/
 realm
 http://developer.wonderpla.net/entry/blog/engineer/iOS_Realm/
 */
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
