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
    var flightsController: PLFlightsController?
    
    private let pilotLogbook1 = UIButton(type: .custom)
    private let pilotLogbook2 = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.isOpaque = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        pl1()
        pl2()
    }
    
    @objc private func dismissKeyboard() {
        dismiss(animated: true)
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
        addVC.delegate = flightsController
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

extension PLAddController: PLAirplaneControllerDelegate {
    func didAddNewAirplane(image: String, name: String, desc: String) {
        print("New airplane added with image: \(image), name: \(name), desc: \(desc)")
    }
}
