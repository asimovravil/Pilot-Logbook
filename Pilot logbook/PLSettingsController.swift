//
//  SettingsViewController.swift
//  AfflilateApp
//
//  Created by Ravil on 05.01.2024.
//

import UIKit
import SnapKit
import StoreKit
import Photos

final class PLSettingsController: UIViewController {
    
    private let pilotLogbook = UISwitch()
    private let pilotVCLogbook1 = UIButton(type: .custom)
    private let pilotVCLogbook2 = UITextField()
    private let pilotLogbook1 = UIImageView()
    private let pilotLogbook2 = UIButton()
    private let pilotLogbook3 = UIButton()
    private let pilotLogbook4 = UIButton()
    private let pilotLogbook5 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        plVC1()
        plVC2()
        pl()
        pl1()
        pl2()
        pl3()
        pl4()
        pl5()
        plBar()
        view.backgroundColor = UIColor(named: "plBack")
        
        if let username = UserDefaults.standard.string(forKey: "username"), !username.isEmpty {
            pilotVCLogbook2.text = username
        } else {
            pilotVCLogbook2.text = "Unknown"
        }

        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            pilotVCLogbook1.setImage(image, for: .normal)
        } else {
            pilotVCLogbook1.setImage(UIImage(named: "accountCamera"), for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pilotVCLogbook2.layer.cornerRadius = 16
        
        pilotVCLogbook1.layer.cornerRadius = pilotVCLogbook1.bounds.size.width / 2
        pilotVCLogbook1.clipsToBounds = true
    }
    
    private func plVC1() {
        pilotVCLogbook1.setImage(UIImage(named: "plC"), for: .normal)
        pilotVCLogbook1.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        view.addSubview(pilotVCLogbook1)
        
        pilotVCLogbook1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(60)
        }
    }
    
    private func plVC2() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "plGray"),
            NSAttributedString.Key.font: UIFont(name: "DroidSans", size: 16)
        ]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: pilotVCLogbook2.frame.height))
        pilotVCLogbook2.leftView = paddingView
        pilotVCLogbook2.leftViewMode = .always
        pilotVCLogbook2.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes as [NSAttributedString.Key : Any])
        pilotVCLogbook2.font = UIFont(name: "DroidSans", size: 16)
        pilotVCLogbook2.borderStyle = .none
        pilotVCLogbook2.textColor = .white
        pilotVCLogbook2.keyboardType = .default
        pilotVCLogbook2.autocorrectionType = .no
        pilotVCLogbook2.backgroundColor = UIColor(named: "plTextField")
        view.addSubview(pilotVCLogbook2)
        
        pilotVCLogbook2.snp.makeConstraints { make in
            make.centerY.equalTo(pilotVCLogbook1.snp.centerY)
            make.leading.equalTo(pilotVCLogbook1.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(51)
        }
    }
    
    private func pl() {
        pilotLogbook.isOn = UserDefaults.standard.bool(forKey: "Switch1State")
        pilotLogbook.addTarget(self, action: #selector(switch1ValueChanged(_:)), for: .valueChanged)
    }
    
    private func pl1() {
        pilotLogbook1.image = UIImage(named: "plset1")
        pilotLogbook1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pilotLogbook1)
        view.addSubview(pilotLogbook)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.top.equalTo(pilotVCLogbook1.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        pilotLogbook.snp.makeConstraints { make in
            make.trailing.equalTo(pilotLogbook1.snp.trailing).offset(-12)
            make.centerY.equalTo(pilotLogbook1.snp.centerY)
        }
    }
    
    private func pl2() {
        pilotLogbook2.setImage(UIImage(named: "plset2"), for: .normal)
        pilotLogbook2.addTarget(self, action: #selector(pilotLogbook2Type), for: .touchUpInside)
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func pl3() {
        pilotLogbook3.setImage(UIImage(named: "plset3"), for: .normal)
        pilotLogbook3.addTarget(self, action: #selector(pilotLogbook3Type), for: .touchUpInside)
        view.addSubview(pilotLogbook3)
        
        pilotLogbook3.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook2.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func pl4() {
        pilotLogbook4.setImage(UIImage(named: "plset4"), for: .normal)
        pilotLogbook4.addTarget(self, action: #selector(pilotLogbook4Type), for: .touchUpInside)
        view.addSubview(pilotLogbook4)
        
        pilotLogbook4.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook3.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func pl5() {
        pilotLogbook5.setImage(UIImage(named: "plset5"), for: .normal)
        pilotLogbook5.addTarget(self, action: #selector(pilotLogbook5Type), for: .touchUpInside)
        view.addSubview(pilotLogbook5)
        
        pilotLogbook5.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook4.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc private func pilotLogbook5Type() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
        let vc = PL1Controller()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    private func plBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.font = UIFont(name: "DroidSans", size: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        navigationItem.titleView = titleLabel
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "plCloseAir.pdf"), style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func switch1ValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "Switch1State")
    }

    @objc private func switch2ValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "Switch2State")
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func pilotLogbook2Type() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func pilotLogbook3Type() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func pilotLogbook4Type() {
        let controller = PrivacyController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension PLSettingsController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
            let resizedImage = resizeImage(image: selectedImage, targetSize: pilotVCLogbook1.bounds.size)
            
            saveImageToLocalStorage(resizedImage)
            
            pilotVCLogbook1.setImage(resizedImage, for: .normal)
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
        
        let scaledImageSize = CGSize(width: 60, height: 60)
        
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        
        return scaledImage
    }
}
