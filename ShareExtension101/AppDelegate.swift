//
//  AppDelegate.swift
//  ShareExtension101
//
//  Created by Oluwadamisi Pikuda on 24/04/2020.
//  Copyright © 2020 Damisi Pikuda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        if let scheme = url.scheme,
            scheme.caseInsensitiveCompare("ShareExtension101") == .orderedSame,
            let page = url.host {

            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }

            print("redirect(to: \(page), with: \(parameters))")

            for parameter in parameters where parameter.key.caseInsensitiveCompare("url") == .orderedSame {
                UserDefaults().set(parameter.value, forKey: "incomingURL")
            }
        }

        return true
    }
}
