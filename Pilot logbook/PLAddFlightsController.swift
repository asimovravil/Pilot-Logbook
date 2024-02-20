//
//  PLAddFlightsController.swift
//  Pilot logbook
//
//  Created by Ravil on 20.02.2024.
//

import UIKit
import SnapKit

final class PLAddFlightsController: UIViewController {
        
    private let pilotLogbook = UIView()
    private let pilotLogbook1 = UIImageView()
    private let pilotLogbook2 = UIButton(type: .custom)
    private let pilotLogbook3 = UIPickerView()
    private let pilotLogbook4 = UITextField()
    private let pilotLogbook5 = UITextField()
    private let pilotLogbook6 = UITextField()
    private let pilotLogbook7 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "plBack")
        pl()
        pl1()
        pl2()
        pl3()
        pl4()
        pl5()
        pl6()
        pl7()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pilotLogbook.layer.cornerRadius = 12
        pilotLogbook4.layer.cornerRadius = 16
        pilotLogbook5.layer.cornerRadius = 16
        pilotLogbook6.layer.cornerRadius = 16
        pilotLogbook7.layer.cornerRadius = 12
        
        pilotLogbook3.layer.cornerRadius = 12
        pilotLogbook3.clipsToBounds = true
    }
    
    private func pl() {
        pilotLogbook.backgroundColor = UIColor(named: "plTextField")
        view.addSubview(pilotLogbook)
        
        pilotLogbook.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.center.equalToSuperview()
            make.height.equalTo(431)
        }
    }
    
    private func pl1() {
        pilotLogbook1.image = UIImage(named: "plCardFlight")
        view.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook.snp.top).offset(20)
            make.centerX.equalTo(pilotLogbook.snp.centerX)
        }
    }
    
    private func pl2() {
        pilotLogbook2.setImage(UIImage(named: "plCloseAir"), for: .normal)
        pilotLogbook2.addTarget(self, action: #selector(pilotLogbook2Type), for: .touchUpInside)
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook.snp.top).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
        }
    }
    
    @objc private func pilotLogbook2Type() {
        dismiss(animated: true, completion: nil)
    }
    
    private func pl3() {
        view.addSubview(pilotLogbook3)
        pilotLogbook3.backgroundColor = UIColor(named: "plBack")
        
        pilotLogbook3.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.bottom).offset(32)
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.height.equalTo(51)
        }
    }
    
    private func pl4() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "plGray"),
            NSAttributedString.Key.font: UIFont(name: "DroidSans", size: 16)
        ]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: pilotLogbook4.frame.height))
        pilotLogbook4.leftView = paddingView
        pilotLogbook4.leftViewMode = .always
        pilotLogbook4.attributedPlaceholder = NSAttributedString(string: "Duration", attributes: attributes as [NSAttributedString.Key : Any])
        pilotLogbook4.font = UIFont(name: "DroidSans", size: 16)
        pilotLogbook4.borderStyle = .none
        pilotLogbook4.textColor = .white
        pilotLogbook4.keyboardType = .default
        pilotLogbook4.autocorrectionType = .no
        pilotLogbook4.backgroundColor = UIColor(named: "plBack")
        view.addSubview(pilotLogbook4)
        
        pilotLogbook4.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook3.snp.bottom).offset(16)
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.height.equalTo(51)
        }
    }
    
    private func pl5() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "plGray"),
            NSAttributedString.Key.font: UIFont(name: "DroidSans", size: 16)
        ]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: pilotLogbook5.frame.height))
        pilotLogbook5.leftView = paddingView
        pilotLogbook5.leftViewMode = .always
        pilotLogbook5.attributedPlaceholder = NSAttributedString(string: "The purpose of the flight", attributes: attributes as [NSAttributedString.Key : Any])
        pilotLogbook5.font = UIFont(name: "DroidSans", size: 16)
        pilotLogbook5.borderStyle = .none
        pilotLogbook5.textColor = .white
        pilotLogbook5.keyboardType = .default
        pilotLogbook5.autocorrectionType = .no
        pilotLogbook5.backgroundColor = UIColor(named: "plBack")
        view.addSubview(pilotLogbook5)
        
        pilotLogbook5.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook4.snp.bottom).offset(16)
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.height.equalTo(51)
        }
    }
    
    private func pl6() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "plGray"),
            NSAttributedString.Key.font: UIFont(name: "DroidSans", size: 16)
        ]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: pilotLogbook6.frame.height))
        pilotLogbook6.leftView = paddingView
        pilotLogbook6.leftViewMode = .always
        pilotLogbook6.attributedPlaceholder = NSAttributedString(string: "Special events (technical issues, etc)", attributes: attributes as [NSAttributedString.Key : Any])
        pilotLogbook6.font = UIFont(name: "DroidSans", size: 16)
        pilotLogbook6.borderStyle = .none
        pilotLogbook6.textColor = .white
        pilotLogbook6.keyboardType = .default
        pilotLogbook6.autocorrectionType = .no
        pilotLogbook6.backgroundColor = UIColor(named: "plBack")
        view.addSubview(pilotLogbook6)
        
        pilotLogbook6.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook5.snp.bottom).offset(16)
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.height.equalTo(51)
        }
    }
    
    private func pl7() {
        pilotLogbook7.setTitle("Add", for: .normal)
        pilotLogbook7.setTitleColor(.white, for: .normal)
        pilotLogbook7.titleLabel?.font = UIFont(name: "DroidSans-Bold", size: 16)
        pilotLogbook7.backgroundColor = UIColor(named: "plRed")
//        pilotLogbook7.addTarget(self, action: #selector(pilotLogbook7Type), for: .touchUpInside)
        view.addSubview(pilotLogbook7)
        
        pilotLogbook7.snp.makeConstraints { make in
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.bottom.equalTo(pilotLogbook.snp.bottom).offset(-20)
            make.height.equalTo(51)
        }
    }
    
//    @objc private func pilotLogbook7Type() {
//        if let name = pilotLogbook5.text, !name.isEmpty, let desc = pilotLogbook6.text, !desc.isEmpty {
//            if let image = pilotLogbook3.image(for: .normal) {
//                let newOrder = Order(name: name, desc: desc, imageData: image.pngData())
//                delegate?.didAddNewFlight(order: newOrder)
//            }
//            self.dismiss(animated: true)
//        } else {
//            let alert = UIAlertController(title: "Warning", message: "Please fill in all fields.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
}
