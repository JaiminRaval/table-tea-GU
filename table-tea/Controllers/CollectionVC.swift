//
//  CollectionVC.swift
//  table-tea
//
//  Created by Jaimin Raval on 17/09/24.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var jokeCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    

    func setupCollectionView() {
        jokeCollection.delegate = self
        jokeCollection.dataSource = self
        let collectionNib = UINib(nibName: "CollectionCell", bundle: nil)
        jokeCollection.register(collectionNib, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.jokeLabel.text = "hahahhahaa"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 400)
    }

}
