//
//  ViewController.swift
//  collectionWebView
//
//  Created by Tayyip Çakmak on 17.01.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
       // collectionView.register(CollectionReusableView.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier)
//        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: "Emma Stone")
       // cell.testBanner.image = UIImage(named: "Emma Stone")
        return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 260)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
         // 1
         case UICollectionView.elementKindSectionHeader:
           // 2
           let headerView = collectionView.dequeueReusableSupplementaryView(
             ofKind: kind,
             withReuseIdentifier: "cellR",
             for: indexPath)

           // 3
           guard let typedHeaderView = headerView as? CollectionReusableView
           else { return headerView }

           // 4
           let searchTerm = "Emma Stone"
            typedHeaderView.testLabel.text = searchTerm
            typedHeaderView.testImage.image = UIImage(named: "Emma Stone")
            typedHeaderView.testWebView.load(URLRequest(url: URL(string: "https://www.google.com/search?q=dolar+tl&sxsrf=APq-WBteOFxRmGy2wLTnRuuGWYZ0YlK-WA%3A1644223057268&ei=UdoAYqv1D8uTxc8PmL6_mA4&oq=dolar&gs_lcp=Cgdnd3Mtd2l6EAEYATIHCCMQsAMQJzIHCCMQsAMQJzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQRxCwAzIHCAAQsAMQQzIHCAAQsAMQQzIKCAAQ5AIQsAMYADIKCAAQ5AIQsAMYADIKCAAQ5AIQsAMYADIMCC4QyAMQsAMQQxgBMgwILhDIAxCwAxBDGAFKBAhBGABKBAhGGAFQAFgAYK4JaAFwAngAgAEAiAEAkgEAmAEAyAERwAEB2gEGCAAQARgJ2gEGCAEQARgI&sclient=gws-wiz")!))
           return typedHeaderView
         default:
           // 5
           assert(false, "Invalid element type")
         }
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            return  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableView.identifier, for: indexPath) as! CollectionReusableView
//        }else {
//            fatalError()
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        <#code#>
//    }


}

