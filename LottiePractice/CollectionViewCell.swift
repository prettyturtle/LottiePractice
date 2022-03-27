//
//  CollectionViewCell.swift
//  LottiePractice
//
//  Created by yc on 2022/03/27.
//

import UIKit
import SnapKit
import Lottie

class CollectinoViewCell: UICollectionViewCell {
    static let identifier = "CollectinoViewCell"
    
    func setup(name: String) {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.4
        layer.cornerRadius = 4.0
        let animationView = AnimationView(name: name)
        animationView.tag = 51
        animationView.loopMode = .loop
        addSubview(animationView)
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8.0)
        }
        
        animationView.play()
    }
    func disappear() {
        guard let playingAnimationView = viewWithTag(51) else { return }
        playingAnimationView.removeFromSuperview()
    }
}
