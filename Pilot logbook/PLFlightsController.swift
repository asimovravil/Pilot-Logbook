//
//  PLFlightsController.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit
import SnapKit

final class PLFlightsController: UIViewController {
    
    private let pilotLogbook = UIImageView()
    private let pilotLogbook1 = UILabel()
    private let pilotLogbook2 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pl1()
        pl2()
        pl3()
        plB()
    }
    
    private func pl1() {
        pilotLogbook.image = UIImage(named: "plMG")
        view.addSubview(pilotLogbook)
        
        pilotLogbook.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(303)
        }
    }
    
    private func pl2() {
        pilotLogbook1.text = "All flights"
        pilotLogbook1.textColor = .white
        pilotLogbook1.font = UIFont(name: "DroidSans", size: 16)
        pilotLogbook1.textAlignment = .left
        view.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func pl3() {
        pilotLogbook2.text = "No flights yet"
        pilotLogbook2.textColor = UIColor(named: "plGray")
        pilotLogbook2.font = UIFont(name: "DroidSans", size: 20)
        pilotLogbook2.textAlignment = .center
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.bottom).offset(90)
            make.centerX.equalToSuperview()
        }
    }
    
    private func plB() {
        let plC = UIImageView()
        plC.image = UIImage(named: "plC")
        plC.widthAnchor.constraint(equalToConstant: 40).isActive = true
        plC.heightAnchor.constraint(equalToConstant: 40).isActive = true
        plC.layer.cornerRadius = 20
        plC.clipsToBounds = true
        
        let titleLabel = UILabel()
        titleLabel.text = "Name"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "DroidSans-Bold", size: 20)
        
        let stackView = UIStackView(arrangedSubviews: [plC, titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 12

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "plTextField")
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        let rightImage = UIImage(named: "plRight")
        let rightBarButtonItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(plRight))
        navigationItem.rightBarButtonItem = rightBarButtonItem
                
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if let username = UserDefaults.standard.string(forKey: "username"), !username.isEmpty {
            titleLabel.text = username
        } else {
            titleLabel.text = "Unknown"
        }

        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            plC.image = image
        } else {
            plC.image = UIImage(named: "accountCamera")
        }
    }
    
    @objc private func plRight() {
        print("good")
    }
}
