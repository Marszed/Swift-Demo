//
//  AppDelegate.swift
//  Marszed
//
//  Created by Marszed on 2017/8/3.
//  Copyright © 2017年 Marszed. All rights reserved.
//

import UIKit

// 当IOS系统与应用程序发生“交互”时，会调用AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 应用程序开始运行时调用
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // 当应用程序即将从活动状态移动到非活动状态时发送。对于某些类型的临时中断（例如传入的电话或SMS消息），或者当用户退出应用程序并开始向后台状态转换时，这种情况可能发生。b
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        //用这种方法来暂停正在进行的任务，关闭定时器，并使图形渲染回调。游戏应该使用这种方法来暂停游戏。
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // 使用此方法释放共享资源、保存用户数据、取消计时器，并存储足够的应用程序状态信息，以恢复应用程序的当前状态，以防止其稍后被终止。
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // 如果您的应用程序支持后台执行，这种方法被称为替代applicationWillTerminate:当用户退出, 例如用户点击Home键。
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        // 作为从背景到活动状态的转换的一部分调用，在这里您可以撤消在进入后台时所做的许多更改。
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        // 在应用程序处于非活动状态时重新启动暂停（或尚未启动）的任务。如果应用程序以前处于后台，可以选择刷新用户界面。
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // 应用程序即将终止时调用。如果需要保存数据, 见applicationDidEnterBackground
    }


}

