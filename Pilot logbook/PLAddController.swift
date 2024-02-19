//
//  PLAddController.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit
import SnapKit

final class PLAddController: UIViewController {
    
    var closeHandler: (() -> Void)?
    
    private let pilotLogbook1 = UIButton(type: .custom)
    private let pilotLogbook2 = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        pl1()
        pl2()
    }
    
    private func pl1() {
        pilotLogbook1.setImage(UIImage(named: "plairplane"), for: .normal)
        pilotLogbook1.addTarget(self, action: #selector(pilotLogbook1Type), for: .touchUpInside)
        view.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-86)
        }
    }
    
    @objc private func pilotLogbook1Type() {
        let addVC = PLAirplaneController()
        addVC.modalPresentationStyle = .overCurrentContext
        addVC.modalTransitionStyle = .crossDissolve
        present(addVC, animated: true, completion: nil)
    }
    
    private func pl2() {
        pilotLogbook2.setImage(UIImage(named: "plflight"), for: .normal)
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(pilotLogbook1.snp.top).offset(-8)
        }
    }
}
