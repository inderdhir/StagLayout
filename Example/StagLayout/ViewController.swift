//
//  ViewController.swift
//  StagLayout
//
//  Created by Inder Dhir on 12/24/2018.
//  Copyright (c) 2018 Inder Dhir. All rights reserved.
//

import UIKit
import StagLayout

class CustomCollectionViewCell: UICollectionViewCell {}

class ViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: StagLayout(ratios: [1.0], itemSpacing: 4)
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cellReuseId")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReuseId", for: indexPath)
        cell.backgroundColor = [UIColor.red, UIColor.green, UIColor.blue].randomElement()
        return cell
    }
}


