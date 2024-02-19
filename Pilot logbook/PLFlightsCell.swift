//
//  DaysCell.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit
import SnapKit

final class PLFlightsCell: UITableViewCell {
    
    static let plID = String(describing: PLFlightsCell.self)
    
    private let pilotLogbook = UIView()
    private let pilotLogbook1 = UIImageView()
    public let pilotLogbook2 = UILabel()
    public let pilotLogbook3 = UILabel()
    private let pilotLogbook4 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        pl()
        pl1()
        pl2()
        pl3()
        pl4()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pilotLogbook.layer.cornerRadius = 12
    }
    
    private func pl() {
        pilotLogbook.backgroundColor = UIColor(named: "plTextField")
        contentView.addSubview(pilotLogbook)
        
        pilotLogbook.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    private func pl1() {
        pilotLogbook1.image = UIImage(named: "cellImage")
        pilotLogbook1.contentMode = .scaleAspectFill
        pilotLogbook1.layer.masksToBounds = true
        contentView.addSubview(pilotLogbook1)
        
        pilotLogbook1.snp.makeConstraints { make in
            make.leading.equalTo(pilotLogbook.snp.leading).offset(16)
            make.centerY.equalTo(pilotLogbook.snp.centerY)
            make.size.equalTo(48)
        }
    }
    
    private func pl2() {
        pilotLogbook2.text = "Cessna 182 Skylane"
        pilotLogbook2.textColor = .white
        pilotLogbook2.numberOfLines = 0
        pilotLogbook2.font = UIFont(name: "DroidSans-Bold", size: 18)
        contentView.addSubview(pilotLogbook2)
        
        pilotLogbook2.snp.makeConstraints { make in
            make.top.equalTo(pilotLogbook1.snp.top).offset(1.5)
            make.leading.equalTo(pilotLogbook1.snp.trailing).offset(12)
        }
    }
    
    private func pl3() {
        pilotLogbook3.text = "Today"
        pilotLogbook3.textColor = UIColor(named: "plGray")
        pilotLogbook3.numberOfLines = 0
        pilotLogbook3.font = UIFont(name: "DroidSans", size: 14)
        contentView.addSubview(pilotLogbook3)

        pilotLogbook3.snp.makeConstraints { make in
            make.leading.equalTo(pilotLogbook1.snp.trailing).offset(12)
            make.bottom.equalTo(pilotLogbook1.snp.bottom).offset(-1.5)
        }
    }
    
    private func pl4() {
        pilotLogbook4.text = "1 h"
        pilotLogbook4.textColor = .white
        pilotLogbook4.numberOfLines = 0
        pilotLogbook4.font = UIFont(name: "Droid", size: 16)
        contentView.addSubview(pilotLogbook4)
        
        pilotLogbook4.snp.makeConstraints { make in
            make.trailing.equalTo(pilotLogbook.snp.trailing).offset(-16)
            make.centerY.equalTo(pilotLogbook.snp.centerY)
        }
    }
}

