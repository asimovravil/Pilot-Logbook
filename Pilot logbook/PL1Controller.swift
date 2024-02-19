//
//  ViewController.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit
import SnapKit

final class PL1Controller: UIViewController {
    
    private let pilotLogbook1 = UIImageView()
    private let pilotLogbook2 = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "plBack")
        pl1()
        pl2()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pilotLogbook2.layer.cornerRadius = 12
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func pl1() {
        pilotLogbook1.image = UIImage(named: "pl1")
        view.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func pl2() {
        pilotLogbook2.setTitle("Continue", for: .normal)
        pilotLogbook2.setTitleColor(.white, for: .normal)
        pilotLogbook2.titleLabel?.font = UIFont(name: "DroidSans-Bold", size: 16)
        pilotLogbook2.backgroundColor = UIColor(named: "plRed")
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.height.equalTo(51)
        }
    }
}

