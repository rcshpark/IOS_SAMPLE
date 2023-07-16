//
//  ContentCollectionViewMainCell.swift
//  NetflixStyleSampleApp
//
//  Created by 박상훈 on 2023/07/17.
//

import UIKit
import SnapKit

class ContentCollectionViewMainCell: UICollectionViewCell{
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackVIew = UIStackView()
    
    let plusButton = UIButton()
    let playButton = UIButton()
    let infoButton = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView,menuStackView].forEach{
            contentView.addSubview($0)
        }
        
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        baseStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        [imageView,descriptionLabel,contentStackVIew].forEach{
            baseStackView.addArrangedSubview($0)
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints{
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        contentStackVIew.axis = .horizontal
        contentStackVIew.alignment = .center
        contentStackVIew.distribution = .equalCentering
        contentStackVIew.spacing = 20
        
        contentStackVIew.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(60)
    }
    
    menuStackView.axis = .horizontal
    menuStackView.alignment = .center
    menuStackView.distribution = .equalSpacing
    menuStackView.spacing = 20
    
    [tvButton,movieButton,categoryButton].forEach{
        menuStackView.addArrangedSubview($0)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 3
    }
        
        [plusButton,infoButton].forEach{
            
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
            $0.adjustVerticalLayout(5)
        }
        
        plusButton.setTitle("내가 찜한 콘텐츠", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        infoButton.setTitle("정보", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        playButton.setTitle("재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 3
        playButton.snp.makeConstraints{
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
      
    tvButton.setTitle("TV 프로그램", for: .normal)
    movieButton.setTitle("영화", for: .normal)
    categoryButton.setTitle("카테고리", for: .normal)
    
    tvButton.addTarget(self, action: #selector(tvButtonTapped), for: .touchUpInside)
    movieButton.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
    categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
    
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        [plusButton,playButton,infoButton].forEach{
            contentStackVIew.addArrangedSubview($0)
        }
    menuStackView.snp.makeConstraints{
        $0.top.equalTo(baseStackView)
        $0.leading.trailing.equalToSuperview().inset(30)
    }
}

    @objc func tvButtonTapped(sender: UIButton!){
        print("Test: TV Button Tapped")
    }
    @objc func movieButtonTapped(sender: UIButton!){
        print("Test: Movie Button Tapped")
    }
    @objc func categoryButtonTapped(sender: UIButton!){
        print("Test: Category Button Tapped")
    }
    @objc func plusButtonTapped(sender: UIButton!){
        print("Test: Plus Button Tapped")
    }
    @objc func infoButtonTapped(sender: UIButton!){
        print("Test: Info Button Tapped")
    }
    @objc func playButtonTapped(sender: UIButton!){
        print("Test: Play Button Tapped")
    }
}
