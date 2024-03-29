//
//  SceneDelegate.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .light
        if UserDefaults.standard.bool(forKey: "ass") {
            window.rootViewController =
            UINavigationController(rootViewController: PLTabController())
        } else {
            window.rootViewController =
            UINavigationController(rootViewController: PL1Controller())
        }
        window.makeKeyAndVisible()
        self.window = window
    }
}
