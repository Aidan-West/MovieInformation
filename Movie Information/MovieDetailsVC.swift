//
//  MovieDetailsVC.swift
//  Movie Information
//
//  Created by Ege on 22.09.2022.
//

import UIKit
import Kingfisher

class MovieDetailsVC: UIViewController {
    var choosenMovie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        createUI()
        
    }
    func createUI(){
        
        view.backgroundColor = .orange
        
        let crossBtn = UIButton()
        crossBtn.backgroundColor = .clear
        crossBtn.frame = CGRect(x: 0.075 * screenWidth, y: 0.05 * screenHeight , width: 0.1 * screenWidth, height: 0.1 * screenWidth)
        crossBtn.setBackgroundImage(UIImage(named: "btn_cross"), for: UIControl.State.normal)
        view.addSubview(crossBtn)
        crossBtn.addTarget(self, action: #selector(crossBtnClicked), for: UIControl.Event.touchUpInside)

        let movieImg = UIImageView()
        movieImg.kf.setImage(with: URL(string: choosenMovie.movieImg))
        movieImg.frame = CGRect(x: 0.225 * screenWidth, y: 0.1 * screenHeight, width: 0.55 * screenWidth, height: 0.55 * screenWidth)
        movieImg.layer.masksToBounds = true
        movieImg.layer.cornerRadius = 10
        movieImg.contentMode = .scaleAspectFit
        view.addSubview(movieImg)
        
        let title = UILabel()
        title.textColor = .black
        title.text = choosenMovie.title
        title.numberOfLines = 4
        title.textAlignment = .center
        title.frame = CGRect(x: 0.1 * screenWidth, y: 0.3 * screenHeight, width: 0.8 * screenWidth, height: 0.4 * screenWidth)
        view.addSubview(title)
        title.font = UIFont(name: "Inter-Bold", size: 20)

        let year = UILabel()
        year.textColor = .black
        year.text = "Movie Year: \(choosenMovie.year)"
        year.numberOfLines = 4
        year.textAlignment = .left
        year.frame = CGRect(x: 0.1 * screenWidth, y: 0.35 * screenHeight, width: 0.8 * screenWidth, height: 0.4 * screenWidth)
        view.addSubview(year)
        year.font = UIFont(name: "Inter-SemiBold", size: 16)
        
        let rate = UILabel()
        rate.textColor = .black
        rate.text = "Movie Rating: \(choosenMovie.rating)"
        rate.textAlignment = .left
        rate.frame = CGRect(x: 0.1 * screenWidth, y: 0.4 * screenHeight, width: 0.8 * screenWidth, height: 0.4 * screenWidth)
        view.addSubview(rate)
        rate.font = UIFont(name: "Inter-SemiBold", size: 16)
        
        let desc = UILabel()
        desc.textColor = .black
        desc.text = choosenMovie.descMovie
        desc.textAlignment = .left
        desc.frame = CGRect(x: 0.1 * screenWidth, y: 0.5 * screenHeight, width: 0.8 * screenWidth, height: 0.5 * screenWidth)
        view.addSubview(desc)
        desc.numberOfLines = 8
        desc.font = UIFont(name: "Inter-Regular", size: 14)

    }
    @objc func crossBtnClicked(){
        dismiss(animated: true)
    }
}
