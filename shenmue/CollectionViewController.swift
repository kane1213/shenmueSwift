//
//  CollectionViewController.swift
//  shenmue
//
//  Created by Mini on 2019/1/13.
//  Copyright © 2019年 Mini. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController {
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Charactors List"
        let dismissButton: UIBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeTableViewController(sender:)))
        navigationItem.leftBarButtonItem = dismissButton
        
        initCollection()
    }
    
    func initCollection() {
        let layout = UICollectionViewFlowLayout()
        let gap:CGFloat = 2
        let singleSize:CGFloat = UIScreen.main.bounds.width / 2 - gap * 2 - 5
        layout.sectionInset = UIEdgeInsets(top: gap, left: gap, bottom: gap, right: gap)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = gap
        
        layout.itemSize = CGSize(width: singleSize, height: singleSize)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        navigationItem.title = "Block items"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //collectionView.heightAnchor.constraint(equalToConstant: 202).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func closeTableViewController(sender: UIBarButtonItem) {
        dismiss(animated: true) {
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.numLabel.text = "\(indexPath.item + 1)"
        
        return cell
    }
}
