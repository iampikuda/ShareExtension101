//
//  SceneDelegate.swift
//  ShareExtension101
//
//  Created by Oluwadamisi Pikuda on 24/04/2020.
//  Copyright © 2020 Damisi Pikuda. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Called when opening a new scene
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let url = connectionOptions.urlContexts.first?.url,
            let scheme = url.scheme,
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
    }

    // Called on existing scenes
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url,
            let scheme = url.scheme,
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
    }
}

