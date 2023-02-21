//
//  ProfileCollectionViewCell.swift
//  Outstagram
//
//  Created by Eunyeong Kim on 2021/08/13.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        imageView.backgroundColor = .tertiaryLabel
    }
}
