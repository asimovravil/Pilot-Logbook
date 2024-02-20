//
//  PLTabController.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit

final class PLTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addedTabBarSetup()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
    private func addedTabBarSetup() {
        let ta1VC = UINavigationController(rootViewController: PLFlightsController())
        let ta2VC = UINavigationController(rootViewController: PLAddController())
        let ta3VC = UINavigationController(rootViewController: PLAviaparkController())
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor(named: "plTextField")
        
        ta1VC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "pltab1")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "pltab1Ac")?.withRenderingMode(.alwaysOriginal)
        )

        ta2VC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "pltab2")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "pltab2")?.withRenderingMode(.alwaysOriginal)
        )
        
        ta3VC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "pltab3")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "pltab3Ac")?.withRenderingMode(.alwaysOriginal)
        )
        
        viewControllers = [ta1VC, ta2VC, ta3VC]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension PLTabController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let viewControllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController),
           viewControllerIndex == 1 {
            let addVC = PLAddController()
            
            if let navController = viewControllers?.first as? UINavigationController,
               let flightsVC = navController.viewControllers.first as? PLFlightsController {
                addVC.flightsController = flightsVC
            }
            
            if let navController = viewControllers?[2] as? UINavigationController,
               let aviaVC = navController.viewControllers.first as? PLAviaparkController {
                addVC.aviaparkController = aviaVC
            }

            addVC.modalPresentationStyle = .overCurrentContext
            addVC.modalTransitionStyle = .crossDissolve
            present(addVC, animated: true, completion: nil)
            
            return false
        }
        return true
    }
}
