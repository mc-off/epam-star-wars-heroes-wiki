//
//  HeroViewController.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 16/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {
    
    var hero:Hero = Hero()

    @IBOutlet weak var naviBar: UINavigationItem!
    @IBOutlet weak var informationTableView: UITableView!
    @IBOutlet weak var summaryView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func sendData(_ anyData: Any?) {
        if let sendedHero = anyData as? Hero {
            hero = sendedHero
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let titleView = UILabel(frame: CGRect(x:0, y:0, width: 40,height: 40))
        titleView.contentMode = .scaleAspectFit
        titleView.text = hero.name
        naviBar.titleView = titleView
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
