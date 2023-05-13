//
//  FeedPostCeel.swift
//  Insta
//
//  Created by Mukhammedali on 10.05.2023.
//

import SnapKit
import UIKit
class FeedPostCeel: UITableViewCell{
    //Mark: Public
    func configure(with info: FeedPostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subTitleLabel.text = info.postSubtitles
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureCommentLable(with: comment)
        }
    }
    //Mark: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Mark: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInsert: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subTitleFontSize: CGFloat = 11
        static let usernameStackTopProfileImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionStackToPostImageOffset : CGFloat = 12
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikeOffset: CGFloat = 12
    }
    
    //Mark: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subTitleFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    private let postImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)
        return label
    }()
    
}

//Mark: - Private methods
private extension FeedPostCeel {
    func initialize(){
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview() .inset(UIConstants.userImageTopInsert)
            make.size.equalTo(UIConstants.userImageSize)
            }
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subTitleLabel)
        contentView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackTopProfileImageOffset )
        }
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview() .inset(UIConstants.contentInset)
        }
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom) .offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.addArrangedSubview(likeButton)
        actionsStack.addArrangedSubview(commentButton)
        actionsStack.addArrangedSubview(shareButton)
        actionsStack.spacing = UIConstants.actionsStackSpacing
        contentView.addSubview(actionsStack)
        actionsStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom) .offset(UIConstants.actionStackToPostImageOffset)
            
        }
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionsStack.snp.bottom) .offset(UIConstants.actionsStackToLikesLabelOffset)
        }
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom) .offset(UIConstants.commentToLikeOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
        
    }
    func configureCommentLable(with comment: CommentShortInfo){
        let string = comment.username + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range  = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLabelFontSize), range: range)
        commentLabel.attributedText = attributedString
    }
}
