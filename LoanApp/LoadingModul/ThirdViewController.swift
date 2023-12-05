//
//  ThirdViewController.swift
//  LoanApp
//
//  Created by Дмитрий Пономарев on 30.11.2023.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
            
    //MARK: - UI properties

    let backgroundImageView = CustomBackgroundImageView()
    let contentView = UIView()
    let topLabelStackView = UIStackView()
    let getMoneylabel = UILabel()
    let forYourLabel = UILabel()
    let needsLabel = UILabel()
    let nowLable = UILabel()
    let manImageView = UIImageView()
    let bottomView = CustomBottomView()
    
    var loginOutput: LoginOutput?

  
    //  MARK: - init

    deinit {
        print("ThirdViewController deinited")
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        addViews()
        setupViews()
        makeConstraints()
        setupActions()
    }
}

private extension ThirdViewController {
    
    //MARK: - addViews
    
    func addViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(topLabelStackView)
        topLabelStackView.addArrangedSubview(getMoneylabel)
        topLabelStackView.addArrangedSubview(forYourLabel)
        topLabelStackView.addArrangedSubview(needsLabel)
        topLabelStackView.addArrangedSubview(nowLable)
        view.addSubview(manImageView)
        view.addSubview(bottomView)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        topLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().inset(20)
            make.width.equalToSuperview()
        }
        manImageView.snp.makeConstraints { make in
            make.top.equalTo(forYourLabel)
            make.centerX.equalToSuperview().offset(-80)
            make.bottom.equalTo(bottomView.snp.top).offset(40)
        }
        bottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.left.right.equalToSuperview()
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        view.backgroundColor = .blue

        topLabelStackView.makeCustomStackView(alignment: .trailing)
        
        getMoneylabel.makespecifiedLabelInStack(text: "Get money", textAllignment: .right)
        forYourLabel.makespecifiedLabelInStack(text: "for your", textAllignment: .right)
        needsLabel.makespecifiedLabelInStack(text: "needs", textAllignment: .right)
        nowLable.makespecifiedLabelInStack(text: "now!", textAllignment: .right)
        
        bottomView.setupCurrentPageNumber(.third)
        
        manImageView.image = UIImage(resource: .man3)
        manImageView.contentMode = .scaleAspectFit
    }
    
    //MARK: - setupActions
    
    func setupActions() {
        bottomView.nextPageButton.addTarget(self, action: #selector(onNextPageButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - objc method

    @objc func onNextPageButtonTapped() {
        loginOutput?.showMainScreen()
    }
}
