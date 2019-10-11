//
//  ViewBook.swift
//  SimpleUIWebView
//
//  Created by RTC-HN154 on 10/11/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class ViewBook: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var type : String?
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    let booksHTML = [
        ("Lập trình iOS Objective-C")
    ]
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        type = self.tabBarItem.title
        self.collectionView.register(UINib(nibName: "ACellBook", bundle: nil), forCellWithReuseIdentifier: "ACellBook")
    }
    
    
}

extension ViewBook: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!
        switch type {
        case "PDF":
            count = booksPDF.count
        case "DOCX":
            count = booksDocx.count
        case "HTML":
            count = booksHTML.count
        default:
            break
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ACellBook", for: indexPath) as! ACellBook
        var thubImg: UIImage!
        var nameLabel: String!
        
        switch type {
        case "PDF":
            thubImg = UIImage(named: booksPDF[indexPath.item] + ".jpg")
            nameLabel = booksPDF[indexPath.item]
        case "DOCX":
            thubImg = UIImage(named: booksDocx[indexPath.item] + ".jpg")
            nameLabel = booksDocx[indexPath.item]
        case "HTML":
            thubImg = UIImage(named: booksHTML[indexPath.item] + ".jpg")
            nameLabel = booksHTML[indexPath.item]
        default:
            break
        }
        
        cell.imageView.image = thubImg
        cell.nameLabel.text = nameLabel
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewDetailBook = self.storyboard?.instantiateViewController(withIdentifier: "DetailBook") as! DetailBook
        var urlString: String!
        switch type {
        case "PDF":
            urlString = booksPDF[indexPath.item]
        case "DOCX":
            urlString = booksDocx[indexPath.item]
        case "HTML":
            urlString = booksHTML[indexPath.item]
        default:
            break
        }
        viewDetailBook.urlString = urlString
        viewDetailBook.type = self.tabBarItem.title!
        self.present(viewDetailBook, animated: true, completion: nil)
//        self.navigationController?.pushViewController(viewDetailBook, animated: true)
    }
    
    
}

extension ViewBook: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/4 - 10, height: collectionView.bounds.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
