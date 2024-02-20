//
//  PLAviaparkController.swift
//  Pilot logbook
//
//  Created by Ravil on 20.02.2024.
//

import UIKit
import SnapKit

final class PLAviaparkController: UIViewController {
    
    var orders = [Order]()
    
    private let pilotLogbook2 = UIImageView()
    private let pilotLogbook3 = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pl2()
        pl3()
        plB()
        
        loadOrders()
    }
    
    private func pl2() {
        pilotLogbook2.image = UIImage(named: "plPlanes")
        view.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func pl3() {
        pilotLogbook3.register(PLFlightsCell.self, forCellReuseIdentifier: PLFlightsCell.plID)
        pilotLogbook3.dataSource = self
        pilotLogbook3.delegate = self
        pilotLogbook3.backgroundColor = .clear
        pilotLogbook3.rowHeight = 88
        pilotLogbook3.showsVerticalScrollIndicator = false
        pilotLogbook3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pilotLogbook3)
        
        pilotLogbook3.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook2.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-6)
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
        let vc = PLSettingsController()
        self.present(vc, animated: true)
    }
}

extension PLAviaparkController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PLFlightsCell.plID, for: indexPath) as? PLFlightsCell else {
            fatalError("Could not cast to DaysCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        let order = orders[indexPath.row]
        cell.pilotLogbook1.image = order.image
        cell.pilotLogbook2.text = order.name
        cell.pilotLogbook3.text = order.desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("good")
    }
}


extension PLAviaparkController: PLFlightControllerDelegate {
    func didAddNewFlight(order: Order) {
        orders.append(order)
        pilotLogbook3.reloadData()
        saveOrders()
    }
    
    func saveOrders() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(orders) {
            UserDefaults.standard.set(encoded, forKey: "orders")
        }
    }
    
    func loadOrders() {
        if let savedOrders = UserDefaults.standard.object(forKey: "orders") as? Data {
            let decoder = JSONDecoder()
            if let loadedOrders = try? decoder.decode([Order].self, from: savedOrders) {
                orders = loadedOrders
            }
        }
    }
}
