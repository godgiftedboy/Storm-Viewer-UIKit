//
//  DetailViewController.swift
//  project1
//
//  Created by Waterflow Technology on 04/04/2025.
//

import UIKit

class DetailViewController: UIViewController {
    //@IBOutlet tells xcode that the line of code has connection to something on interface builder.
    @IBOutlet var imageView: UIImageView!
    //implicitly unwrapped UIImageView as it might be nil and it will be there when we need it in this case.
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage;
        navigationItem.largeTitleDisplayMode = .never;

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnTap = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.hidesBarsOnTap = false;
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
