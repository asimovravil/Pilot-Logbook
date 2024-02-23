//
//  PL3Controller.swift
//  Pilot logbook
//
//  Created by Ravil on 19.02.2024.
//

import UIKit
import SnapKit
import Photos

final class PL3Controller: UIViewController {
    
    private let pilotLogbook = UIImageView()
    private let pilotLogbook1 = UIImageView()
    private let pilotLogbook2 = UIButton(type: .custom)
    private let pilotLogbook3 = UITextField()
    private let pilotLogbook4 = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "plBack")
        pl()
        pl1()
        pl2()
        pl3()
        pl4()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pilotLogbook3.layer.cornerRadius = 16
        pilotLogbook4.layer.cornerRadius = 12
        
        pilotLogbook2.layer.cornerRadius = pilotLogbook2.bounds.size.width / 2
        pilotLogbook2.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func pl() {
        pilotLogbook.image = UIImage(named: "plp3")
        view.addSubview(pilotLogbook)

        pilotLogbook.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(4)
        }
    }
    
    private func pl1() {
        pilotLogbook1.image = UIImage(named: "plt")
        view.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func pl2() {
        pilotLogbook2.setImage(UIImage(named: "plC"), for: .normal)
        pilotLogbook2.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(60)
        }
    }
    
    private func pl3() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "plGray"),
            NSAttributedString.Key.font: UIFont(name: "DroidSans", size: 16)
        ]
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: pilotLogbook3.frame.height))
        pilotLogbook3.leftView = paddingView
        pilotLogbook3.leftViewMode = .always
        pilotLogbook3.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes as [NSAttributedString.Key : Any])
        pilotLogbook3.font = UIFont(name: "DroidSans", size: 16)
        pilotLogbook3.borderStyle = .none
        pilotLogbook3.textColor = .white
        pilotLogbook3.keyboardType = .default
        pilotLogbook3.autocorrectionType = .no
        pilotLogbook3.backgroundColor = UIColor(named: "plTextField")
        view.addSubview(pilotLogbook3)
        
        pilotLogbook3.snp.makeConstraints { make in
            make.centerY.equalTo(pilotLogbook2.snp.centerY)
            make.leading.equalTo(pilotLogbook2.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(51)
        }
    }
    
    private func showErrorMessage() {
        let alertController = UIAlertController(title: "Error", message: "Please enter a name longer than three characters", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func pl4() {
        pilotLogbook4.setTitle("Continue", for: .normal)
        pilotLogbook4.setTitleColor(.white, for: .normal)
        pilotLogbook4.titleLabel?.font = UIFont(name: "DroidSans-Bold", size: 16)
        pilotLogbook4.backgroundColor = UIColor(named: "plRed")
        pilotLogbook4.addTarget(self, action: #selector(pilotLogbook2Type), for: .touchUpInside)
        view.addSubview(pilotLogbook4)
        
        pilotLogbook4.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.height.equalTo(51)
        }
    }
    
    @objc private func pilotLogbook2Type() {
        guard let firstName = pilotLogbook3.text, firstName.count > 3 else {
            showErrorMessage()
            return
        }
        
        UserDefaults.standard.set(firstName, forKey: "username")
        
        UserDefaults.standard.set(true, forKey: "ass")
        print("Value of 'ass' key is set to true")
        
        if let profileImage = pilotLogbook2.image(for: .normal), let imageData = profileImage.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")
        }
        
        let tabbarVC = PLTabController()
        tabbarVC.modalPresentationStyle = .fullScreen
        present(tabbarVC, animated: true)
    }
}

extension PL3Controller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
            let resizedImage = resizeImage(image: selectedImage, targetSize: pilotLogbook2.bounds.size)
            
            saveImageToLocalStorage(resizedImage)
            
            pilotLogbook2.setImage(resizedImage, for: .normal)
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

extension PL3Controller: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == pilotLogbook3, let firstName = textField.text {
            UserDefaults.standard.set(firstName, forKey: "userFirstName")
            print("Saved first name: \(firstName)")
        }
        textField.resignFirstResponder()
        return true
    }
}
