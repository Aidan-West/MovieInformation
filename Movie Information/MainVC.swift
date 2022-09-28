//
//  ViewController.swift
//  Movie Information
//
//  Created by Ege on 21.09.2022.
//

import UIKit
import Kingfisher
import Lottie

class MainVC: UIViewController, UISearchBarDelegate {
   
    var moviesArr = [Movie]()
    var filteredMovieArr = [Movie]()
    var moviesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let searchBar = UISearchBar()
    var isSearching = false
    var animationView: AnimationView?
    let searchEmptyTitle = UILabel()

    enum ProgressKeyFrames: CGFloat {
        
           case start = 100
           case end = 110
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        getAPI()
        animationStarts()
        animationView?.backgroundColor = .clear
        animationView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {

        moviesCollectionView.reloadData()

    }

    private func animationStarts() {
      
      animationView?.play(fromFrame: 0, toFrame: ProgressKeyFrames.start.rawValue, loopMode: .none) { [weak self] (_) in
      
        self?.animatonStops()
        
      }
      
    }

    private func animatonStops() {
      
        animationView?.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .none) { [weak self] (_) in
        self?.animationView?.isHidden = true
        self?.createSearchbar()
        self?.createMoviesCollectionview()
        
      }
      
    }
  
    func getAPI(){
        
        APIHandler().getMovies { [unowned self] mov in
            
            moviesArr = mov
            filteredMovieArr = moviesArr
            DispatchQueue.main.async { [unowned self] in
                moviesCollectionView.reloadData()
                
            }
           
        }
    }
    
    func createUI(){
        
        view.backgroundColor = .orange
            
        createLoadingView()
        
    }
    
    func createLoadingView(){
        
        animationView = .init(name: "loading")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
    }
    func createSearchbar(){
        
        searchBar.searchTextField.placeholder = "Search Your Movie"
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .red
        searchBar.tintColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 1)
        searchBar.searchTextField.textColor =  .black
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = .systemFont(ofSize: 14)
        searchBar.delegate = self
        searchBar.frame = CGRect(x: 0.05 * screenWidth, y: 0.075 * screenHeight, width: 0.9 * screenWidth, height: 50)
        view.addSubview(searchBar)
        
        
    }
    
    func createMoviesCollectionview(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0.3 * screenWidth
        flowLayout.collectionView?.layer.cornerRadius = 10
        let size = CGSize(width: 0.85 * screenWidth , height: 0.2 * screenHeight)
        flowLayout.itemSize = size
        moviesCollectionView = UICollectionView(frame: CGRect(x: 0 * screenWidth , y: 0.125 * screenHeight, width: 1 * screenWidth, height: 0.875 * screenHeight), collectionViewLayout: flowLayout)
        moviesCollectionView.contentInset = UIEdgeInsets(top: 0.05 * screenHeight, left: 0 , bottom: 0, right: 0)
        moviesCollectionView.backgroundColor = .clear
        moviesCollectionView.alwaysBounceVertical = true
        moviesCollectionView.showsVerticalScrollIndicator = false
        moviesCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        view.addSubview(moviesCollectionView)
   
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            filteredMovieArr = moviesArr
            view.endEditing(true)
            
            moviesCollectionView.reloadData()
        }else{
            isSearching = true
            filteredMovieArr = moviesArr.filter({ (title) in
                return title.title.lowercased().contains(searchText.lowercased())
            })
            if filteredMovieArr.isEmpty == true{
                searchEmptyTitle.textColor = .black
                searchEmptyTitle.text = "There is no matched movie names"
                searchEmptyTitle.textAlignment = .center
                searchEmptyTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.35 * screenHeight, width: 0.8 * screenWidth, height: 0.4 * screenWidth)
                view.addSubview(searchEmptyTitle)
                searchEmptyTitle.font = .systemFont(ofSize: 20)
                searchEmptyTitle.isHidden = false
                
            }
            else {
                searchEmptyTitle.isHidden = true
            }
            moviesCollectionView.reloadData()
        }
       
    }

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredMovieArr.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
            let cellWidth = cell.frame.width
            let cellHeight = cell.frame.height
          
            cell.movieImg.kf.setImage(with: URL(string: filteredMovieArr[indexPath.row].movieImg))
            cell.backgroundColor = .clear
            cell.layer.cornerRadius = 20
            cell.movieImg.frame = CGRect(x: 0 * cellWidth, y: 0 * cellHeight, width: 0.4 * cellWidth, height: 0.65 * cellWidth)
            cell.movieImg.contentMode = .scaleAspectFit
            cell.movieImg.translatesAutoresizingMaskIntoConstraints = false
            cell.movieImg.clipsToBounds = true
            cell.movieImg.layer.masksToBounds = true
            cell.movieImg.layer.cornerRadius = 20

            cell.title.text = filteredMovieArr[indexPath.row].title
            cell.title.numberOfLines = 2
            cell.title.frame = CGRect(x: 0.5 * cellWidth, y: -0.25 * cellHeight, width: 0.5 * cellWidth, height: 0.5 * cellWidth)
        
            cell.descMovie.text = filteredMovieArr[indexPath.row].descMovie
            cell.descMovie.frame = CGRect(x: 0.5 * cellWidth, y: 0.05 * cellHeight, width: 0.5 * cellWidth, height: 0.7 * cellWidth)
            cell.descMovie.numberOfLines = 8
 
            return cell
    
}

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = MovieDetailsVC()
        destinationVC.choosenMovie = filteredMovieArr[indexPath.row]
        presentVC(currentVC: self, destinationVC: destinationVC, toDirection: .right)
    }
}
