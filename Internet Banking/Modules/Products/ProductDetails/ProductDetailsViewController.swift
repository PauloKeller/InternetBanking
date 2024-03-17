//
//  ProductDetailsViewController.swift
//  Internet Banking
//
//  Created by Paulo Keller on 17/03/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
  var item: ProductItemEntity!
  
  let bannerImage: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleAspectFit
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 18)
    label.numberOfLines = 0
    label.textAlignment = .justified
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private func viewConfiguration() {
    view.backgroundColor = .white
    navigationController?.setNavigationBarHidden(false, animated: false)
    title = item.name
    
    if let url = URL(string: item.imageURL) {
      bannerImage.load(url: url)
    }
    
    descriptionLabel.text = item.description
    
    view.addSubview(bannerImage)
    view.addSubview(descriptionLabel)
    
    NSLayoutConstraint.activate([
      bannerImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      bannerImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      bannerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      bannerImage.heightAnchor.constraint(equalToConstant: 200)
    ])
    
    NSLayoutConstraint.activate([
      descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      descriptionLabel.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 12),
    ])
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewConfiguration()
  }
}
