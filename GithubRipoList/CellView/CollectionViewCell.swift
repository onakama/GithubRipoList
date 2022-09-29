//
//  CollectionViewCell.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var RepoName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .gray
    }

}
