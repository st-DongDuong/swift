//
//  UImageViewExt.swift
//  Dong
//
//  Created by Dong Duong V. on 5/9/22.
//

import UIKit

extension UIImageView {
  func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil,
        let image = UIImage(data: data)
        else { return }
        
      DispatchQueue.main.async() { [weak self] in
        self?.image = image
      }
    }.resume()
  }

  func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
  }
}
