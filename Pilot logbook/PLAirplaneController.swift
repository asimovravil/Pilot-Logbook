//
//  PLAirplaneController.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit
import SnapKit
import Photos

protocol PLFlightControllerDelegate: AnyObject {
    func didAddNewFlight(order: Order)
    func saveOrders()
    func loadOrders()
}

final class PLAirplaneController: UIViewController {
    
    weak var delegate: PLFlightControllerDelegate?
        
    private let pilotLogbook = UIView()
    private let pilotLogbook1 = UIImageView()
    private let pilotLogbook2 = UIButton(type: .custom)
    private let pilotLogbook3 = UIButton(type: .custom)
    private let pilotLogbook4 = UILabel()
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pilotLogbook.layer.cornerRadius = 12
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
            make.height.equalTo(417)
        }
    }
    
    private func pl1() {
        pilotLogbook1.image = UIImage(named: "plCardAir")
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
        pilotLogbook3.setImage(UIImage(named: "plCameraAir"), for: .normal)
        pilotLogbook3.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        view.addSubview(pilotLogbook3)
        
        pilotLogbook3.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.bottom).offset(32)
            make.centerX.equalTo(pilotLogbook.snp.centerX)
        }
    }
    
    private func pl4() {
        pilotLogbook4.text = "Airplane’s Photo"
        pilotLogbook4.textColor = UIColor(named: "plGray")
        pilotLogbook4.font = UIFont(name: "DroidSans", size: 12)
        pilotLogbook4.textAlignment = .center
        view.addSubview(pilotLogbook4)
        
        pilotLogbook4.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook3.snp.bottom).offset(10)
            make.centerX.equalTo(pilotLogbook.snp.centerX)
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
        pilotLogbook5.attributedPlaceholder = NSAttributedString(string: "Airplane name", attributes: attributes as [NSAttributedString.Key : Any])
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
        pilotLogbook6.attributedPlaceholder = NSAttributedString(string: "Description", attributes: attributes as [NSAttributedString.Key : Any])
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
        pilotLogbook7.addTarget(self, action: #selector(pilotLogbook7Type), for: .touchUpInside)
        view.addSubview(pilotLogbook7)
        
        pilotLogbook7.snp.makeConstraints { make in
            make.leading.equalTo(pilotLogbook.snp.leading).offset(20)
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-20)
            make.bottom.equalTo(pilotLogbook.snp.bottom).offset(-20)
            make.height.equalTo(51)
        }
    }
    
    @objc private func pilotLogbook7Type() {
        if let name = pilotLogbook5.text, !name.isEmpty, let desc = pilotLogbook6.text, !desc.isEmpty {
            if let image = pilotLogbook3.image(for: .normal) {
                let newOrder = Order(name: name, desc: desc, imageData: image.pngData())
                delegate?.didAddNewFlight(order: newOrder)
            }
            self.dismiss(animated: true)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Please fill in all fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension PLAirplaneController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc private func changeProfileImage() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePicker()
                }
            }
        } else if status == .authorized {
            self.presentImagePicker()
        }
    }
    
    func presentImagePicker() {
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            let resizedImage = resizeImage(image: selectedImage, targetSize: pilotLogbook3.bounds.size)
            
            saveImageToLocalStorage(resizedImage)
            
            pilotLogbook3.setImage(resizedImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func saveImageToLocalStorage(_ image: UIImage) {
        if let imageData = image.pngData() {
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        _ = min(widthRatio, heightRatio)
        
        let scaledImageSize = CGSize(width: 80, height: 80)
        
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        
        return scaledImage
    }
}
