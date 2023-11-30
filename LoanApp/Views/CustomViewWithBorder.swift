//
//  File.swift
//  LoanApp
//
//  Created by Дмитрий Пономарев on 01.12.2023.
//

import UIKit

class CustomViewWithBorder: UIView {
    
    let label = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewWithBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewWithBorder() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 28
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 4
        self.addSubview(label)
        self.addSubview(imageView)
        setupSubViews()
        setupConstraints()
    }
    
    func setupSubViews() {
        self.label.text = "Logout"
        self.label.textColor = .blue
        self.label.textAlignment = .center
        self.label.font = UIFont.systemFont(ofSize: 36, weight: .black)
        self.imageView.image = UIImage.logout
        self.imageView.contentMode = .scaleAspectFit
        
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(imageView.snp.left)
            make.centerY.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(2)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().inset(2)
            make.width.equalTo(imageView.snp.height)
        }
    }
}
