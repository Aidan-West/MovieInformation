//
//  MovieCollectionViewCell.swift
//  Movie Information
//
//  Created by Ege on 22.09.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var title = UILabel()
    var year = UILabel()
    var movieImg = UIImageView()
    var descMovie = UILabel()
    var rating = UILabel()

   override init(frame: CGRect) {
       
      super.init(frame: frame)

       contentView.addSubview(title)
       contentView.addSubview(year)
       contentView.addSubview(descMovie)
       contentView.addSubview(rating)
       contentView.addSubview(movieImg)
       
       title.font = UIFont(name: "Inter-Bold", size: 18)
       descMovie.font = UIFont(name: "Inter-Light", size: 14)


   }

   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
