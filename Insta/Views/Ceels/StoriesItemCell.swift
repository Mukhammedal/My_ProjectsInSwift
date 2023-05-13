//
//  StoriesItemCell.swift
//  Insta
//
//  Created by Mukhammedali on 10.05.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    // Mark: - Public
    func configure(with info: FeedStoriesItemCellInfo) {
        ImageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }
    //Mark: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Mark: - Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let LabelToCellInsert: CGFloat = 6
        static let imageToLabelOffSet: CGFloat = 6
        static let usernameFontSize: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
        
    }
    
    //Mark: - Private Properties
    private let ImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font =  .systemFont(ofSize: UIConstants.usernameFontSize)
        label.textAlignment = .center
        return label
    }()
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "AddStoryButton"), for: .normal)
        return button
    }()
    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Story ring")
        return view
    }()
    
}


//Mark: - Private Methods
private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(ImageView)
        ImageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.LabelToCellInsert)
            make.top.equalTo(ImageView.snp.bottom).offset(UIConstants.imageToLabelOffSet)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(ImageView)
            make.size.equalTo(UIConstants.plusButtonSize )
        }
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(ImageView)
            make.size.equalTo(UIConstants.circleSize)
        }
    }
}
