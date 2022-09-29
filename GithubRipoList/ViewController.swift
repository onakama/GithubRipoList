//
//  ViewController.swift
//  GithubRipoList
//
//  Created by onakama on 2022/09/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var indivator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    private var items: [Response.items] = []
    private let viewModel = ViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
        viewModel.$isLoading
            .sink { [weak self] isLoading in
                guard let self else { return }
                switch isLoading {
                case true:
                    self.indivator.isHidden = false
                    self.indivator.startAnimating()
                case false:
                    print("aaa")
                    self.indivator.stopAnimating()
                    self.indivator.isHidden = true
                    print("aaa")
                }
            }.store(in: &subscriptions)
        
        viewModel.$items
            .sink { [weak self] items in
                guard let self else { return }
                self.items = items
                self.collectionView.reloadData()
            }.store(in: &subscriptions)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        print(indexPath)
        cell.userName.text = items[indexPath.row].owner.login
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)タップされたよ")
    }
}
