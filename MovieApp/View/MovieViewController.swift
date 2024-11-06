//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Tong Viet Dung on 5/11/24.
//

import UIKit

class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 16, *) {
            navigationItem.style = .navigator
        }
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationItem.title = NSLocalizedString("Detail", comment: "Detail view controller title")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "top-bar-right"))
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        // Do any additional setup after loading the view.
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
