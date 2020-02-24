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
    var heroVocabulary = [HeroParameters: String]()
    var keys = [HeroParameters]()
    var values = [String]()
    
    //MARK: if you want to see deefault info (name + planet) in informationTable - set it true
    let WITH_DEFFAULT:Bool = true
    
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var naviBar: UINavigationItem!
    @IBOutlet weak var informationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrayName = hero.name.components(separatedBy: " ")
        
        
        labelName.text = arrayName.first
        labelSurname.text = arrayName.last
        
        registerTableViewCells()
        
        heroVocabulary = hero.getHeroVocabulary(withtDeffault: WITH_DEFFAULT)
        keys = Array(heroVocabulary.keys)
        values = Array(heroVocabulary.values)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let titleView = UILabel(frame: CGRect(x:0, y:0, width: 40,height: 40))
        titleView.contentMode = .scaleAspectFit
        titleView.text = hero.name
        naviBar.titleView = titleView
    }
    
    func sendData(_ anyData: Any?) {
        if let sendedHero = anyData as? Hero {
            hero = sendedHero
        }
    }
    
    private func registerTableViewCells () {
        let cell = UINib(nibName: "InformationTableViewCell", bundle: nil)
        informationTableView.register(cell, forCellReuseIdentifier: "InformationTableViewCell")
    }
}

extension HeroViewController: UITableViewDataSource,UITableViewDelegate {
    private func checkDuplicateData(namePerson: String) ->Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WITH_DEFFAULT ? heroVocabulary.count : heroVocabulary.count-2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Additional info"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell {
            cell.tittleLabel.text = keys[indexPath.row].rawValue
            cell.detailLabel.text = values[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
