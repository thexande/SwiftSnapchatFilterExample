//
//  ViewController.swift
//  case
//
//  Created by Alexander Murphy on 11/21/16.
//  Copyright © 2016 Alexander Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var croppingEnabled: Bool = true
    var libraryEnabled: Bool = true
    var caseImage: UIImage?

    @IBOutlet weak var caseImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showFilters"){
            let destination = segue.destination as! AddFilterViewController
            if (self.caseImage != nil) {
                destination.caseImage = caseImage
            }
        }
    }
    
    @IBAction func openCameraClicked(_ sender: Any) {
        let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled, allowsLibraryAccess: libraryEnabled) { [weak self] image, asset in
            //self?.imageView.image = image
            print(image)
            self?.caseImageView.image = image
            self?.caseImage = image
            self?.dismiss(animated: true, completion: nil)
        }
        present(cameraViewController, animated: true, completion: nil)
    }

    @IBAction func addFilterClicked(_ sender: Any) {
        performSegue(withIdentifier: "showFilters", sender: self)
    }
}

