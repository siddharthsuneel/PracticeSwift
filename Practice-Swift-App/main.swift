//
//  main.swift
//  Practice-Swift-App
//
//  Created by Siddharth Suneel on 26/02/19.
//  Copyright © 2019 Siddharth Suneel. All rights reserved.
//

import Foundation
import UIKit

//Replace NewAppDelegate with AppDelegate to enable custom App delegate start working...
let appDelegateClass: AnyClass = NSClassFromString("NewAppDelegate") ?? NewAppDelegate.self

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(appDelegateClass)
)
