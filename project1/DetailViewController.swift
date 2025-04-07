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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped));

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
   
    //UIBarButtonItem is beyond the UIKit. So, It is written in objective c rather than Swift.
    //so @objc is required in this function as it is being accessed by UIBarButtonItem.
    //so that it can recognize the function.
    @objc func shareTapped (){
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: []);
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem;
        present(vc, animated: true);
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
