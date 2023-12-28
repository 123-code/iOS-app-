//
//  ViewController.swift
//  HoloiOS
//
//  Created by alf on 12/13/23.
//


import UIKit
import Photos
import PhotosUI


class MyCell: UICollectionViewCell{
    let imageView = UIImageView()
    override init(frame:CGRect){
        super.init(frame:frame)
        imageView.layer.cornerRadius = frame.width / 2
            imageView.clipsToBounds = true
        addSubview(imageView)
        
    }
    required init?(coder:NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        imageView.frame = bounds
    }
}


class ViewController: UIViewController,PHPickerViewControllerDelegate, UICollectionViewDataSource{

    
    private let nextButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("Next", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          button.backgroundColor = .black
          button.layer.cornerRadius = 10
          // Add target action for addImageTapped method
          button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
          return button
      }()
    
    private let collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:150,height:150)
        let c = UICollectionView(
        frame:.zero,collectionViewLayout:layout
        )
        let lightBlue = UIColor(red: 0.88, green: 0.93, blue: 5.00, alpha: 2.0)
        c.backgroundColor = lightBlue
        c.register(MyCell.self,forCellWithReuseIdentifier:"cell")
        return c
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    
        collectionView.dataSource = self
        collectionView.frame=view.bounds
        title = "Holo Photo Picker "
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add  ,target: self, action:#selector(didTapAdd))
        
   
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   nextButton.widthAnchor.constraint(equalToConstant: 200), // Set width
                   nextButton.heightAnchor.constraint(equalToConstant: 50)
                
               ])
        if let futuraFont = UIFont(name: "Futura", size: 16) { // Replace "Futura" with your desired font name
                    nextButton.titleLabel?.font = futuraFont
                }
    }
    
    @objc func addImageTapped(){
        let loadingView = UIActivityIndicatorView(style: .large)
        loadingView.color = .gray
        loadingView.startAnimating()
        nextButton.addSubview(loadingView)
        loadingView.center = CGPoint(x: nextButton.bounds.width / 2, y: nextButton.bounds.height / 2)
        
        DispatchQueue.main.asyncAfter(deadline:.now()+2.0){
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
            self.nextButton.isEnabled = true
            let frame = CGRect(x: 0, y: 0, width: 200, height: 300)
            let nextVC = FinishMemController(frame: frame)
            self.navigationController?.pushViewController(nextVC, animated: true)
        
        }
    }
    
    
    @objc private func didTapAdd(){
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        config.filter = .images //PHPickerFilter.any(of:[.images])
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc,animated:true)
        
        
        
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated:true,completion:nil)
        let group = DispatchGroup()
        results.forEach{
            result in group.enter()
            result.itemProvider.loadObject(ofClass:UIImage.self){
                [weak self] reading,error in
                defer{
                    group.leave()
                }
                guard let image = reading as? UIImage,error == nil else{
                    return
                }
                self?.images.append(image)
            }
            
        }
        
        group.notify(queue:.main){
            print(self.images.count)
            self.collectionView.reloadData()
            uploadImages(self.images)
        }
        
    }
    

    
    private var images = [UIImage]()

    func collectionView(_ collectionView:UICollectionView,numberOfItemsInSection section:Int)->Int{
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCell else {
            fatalError()
        }
        cell.imageView.image = images[indexPath.row]
        return cell
    }
}
