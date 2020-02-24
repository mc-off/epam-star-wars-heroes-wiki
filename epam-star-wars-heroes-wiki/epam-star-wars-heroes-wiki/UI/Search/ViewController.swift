//
//  ViewController.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 15/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    var heroArray:[Hero] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let deffaultHero: Hero = Hero(name: "Baba Vova", planet: "Sormovo")
        
        for i in 0...30 {
            heroArray.append(Hero(name: deffaultHero.name+String(i),  planet: deffaultHero.planet+String(i),sex: getRandomSex()))
        }
        
        registerTableViewCells()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let titleView = UILabel(frame: CGRect(x:0, y:0, width: 40,height: 40))
        titleView.contentMode = .scaleAspectFit
        titleView.text = "Search"
        navItem.titleView = titleView
    }
    
    private func registerTableViewCells () {
        let cell = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SearchTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    private func checkDuplicateData(namePerson: String) ->Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search results"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            cell.cellLabel.text = heroArray[indexPath.row].name
            cell.cellSubLabel.text = heroArray[indexPath.row].planet
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let heroViewController = storyboard.instantiateViewController(withIdentifier: "heroVC") as? HeroViewController else {return}
        
        self.tableView.cellForRow(at: indexPath)?.isSelected = false
        
        if let cell = self.tableView.cellForRow(at: indexPath) as? SearchTableViewCell{
            guard let textName = cell.cellLabel.text else { return }
            heroViewController.sendData(heroArray[indexPath.row])
            
            if checkDuplicateData(namePerson: textName){
                searchBar.text = ""
                tableView.reloadData()
            }
        }
        navigationController?.pushViewController(heroViewController, animated: true)
    }
}
