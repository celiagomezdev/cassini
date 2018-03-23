//
//  ImageViewController.swift
//  Cassini
//
//  Created by Celia Gómez de Villavedón on 23/03/2018.
//  Copyright © 2018 Celia Gómez de Villavedón Pedrosa. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }

    var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.addSubview(imageView)
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }

}
