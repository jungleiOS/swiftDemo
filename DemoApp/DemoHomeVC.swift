//
//  DemoRootVC1.swift
//  DemoApp
//
//  Created by 蒋俊 on 2019/10/20.
//  Copyright © 2019 蒋俊. All rights reserved.
//

import UIKit
import PureLayout

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
class DemoHomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let kCell = "cell"
    
    var collection:UICollectionView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.title = "1"
        self.navigationController?.title = "2"
        self.navigationItem.title = "3"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.systemPink
        navigationController?.navigationBar.isTranslucent = false
        
        self.view.backgroundColor = UIColor.orange
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width: kScreenWidth, height: 44)
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 0;
        self.collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        self.collection.backgroundColor = UIColor.white
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: kCell)
        self.view.addSubview(self.collection)

        self.collection.autoPinEdge(toSuperviewSafeArea: ALEdge.top)
        self.collection.autoPinEdge(toSuperviewSafeArea: ALEdge.bottom)
        self.collection.autoPinEdge(toSuperviewEdge: ALEdge.left)
        self.collection.autoPinEdge(toSuperviewEdge: ALEdge.right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCell, for: indexPath)
        cell.contentView.backgroundColor = UIColor.yellow
        return cell
    }

}
