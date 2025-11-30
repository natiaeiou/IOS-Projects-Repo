//
//  SceneDelegate.swift
//  MacMiller
//
//  Created by Atinati on 13.10.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let _ = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController(rootViewController: AlbumListVC())
        let window = UIWindow(windowScene: scene as! UIWindowScene)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }

   
}

