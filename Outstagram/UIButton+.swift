//
//  UIButton+.swift
//  Outstagram
//
//  Created by Eunyeong Kim on 2021/08/13.
//

import UIKit
// 버튼에 이미지 설정시, 사이즈가 제각각인 이슈 해결을 위한 extension
extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill

        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero

        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
