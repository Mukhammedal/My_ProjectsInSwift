//
//  FeedPostItemInfo.swift
//  Insta
//
//  Created by Mukhammedali on 09.05.2023.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitles: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}
struct CommentShortInfo {
    let username: String
    let commentText: String
}
