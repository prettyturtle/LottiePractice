//
//  MainViewController.swift
//  LottiePractice
//
//  Created by yc on 2022/03/27.
//

import UIKit
import SnapKit
import Lottie

class MainViewController: UIViewController {
    
    let animationList = [
        "100261-wave",
        "1446-bikingiscool",
        "100070-mail-success",
        "100175-bloading",
        "100332-controller-playstation",
        "100595-ape-walk",
        "99298-food-delivery",
        "99362-animation-no-face",
        "99690-flowers",
        "99705-food-is-ready",
        "99225-box-rotating",
        "98267-bicycle",
        "97039-oh-no",
        "96957-lock",
        "87670-satisfied-bear",
        "81388-pumpkin-evil-laugh-loop",
        
        "100261-wave",
        "1446-bikingiscool",
        "100070-mail-success",
        "100175-bloading",
        "100332-controller-playstation",
        "100595-ape-walk",
        "99298-food-delivery",
        "99362-animation-no-face",
        "99690-flowers",
        "99705-food-is-ready",
        "99225-box-rotating",
        "98267-bicycle",
        "97039-oh-no",
        "96957-lock",
        "87670-satisfied-bear",
        "81388-pumpkin-evil-laugh-loop"
    ]
    
    private lazy var animationView = AnimationView(name: animationList.randomElement()!)
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationViewPlay()
    }
    
}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animationList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectinoViewCell.identifier, for: indexPath) as? CollectinoViewCell else { return UICollectionViewCell() }
        return cell
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CollectinoViewCell else { return }
        cell.setup(name: animationList[indexPath.item])
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CollectinoViewCell else { return }
        cell.disappear()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 48.0) / 2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let popupAnimationView = AnimationView(name: animationList[indexPath.item])
        popupAnimationView.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPopupAnimationView(_:)))
        popupAnimationView.addGestureRecognizer(tap)
        view.addSubview(popupAnimationView)
        popupAnimationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        popupAnimationView.play { _ in
            popupAnimationView.removeFromSuperview()
        }
    }
    @objc func didTapPopupAnimationView(_ recognizer: UITapGestureRecognizer) {
        recognizer.view?.removeFromSuperview()
    }
}

private extension MainViewController {
    func animationViewPlay() {
        view.addSubview(animationView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPopupAnimationView(_:)))
        animationView.addGestureRecognizer(tap)
        animationView.snp.makeConstraints {
            $0.size.equalTo(UIScreen.main.bounds.width / 2.0)
            $0.center.equalToSuperview()
        }
        animationView.play {[weak self] finish in
            self?.animationView.removeFromSuperview()
            self?.attribute()
            self?.layout()
        }
    }
    func attribute() {
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectinoViewCell.self, forCellWithReuseIdentifier: CollectinoViewCell.identifier)
        
    }
    func layout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
