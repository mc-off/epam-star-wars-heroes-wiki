//
//  ViewController.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 15/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var heroArray:[Hero] = []
    var filteredHeroes: [Hero] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
        registerTableView()
        registerSearchController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let titleView = UILabel(frame: CGRect(x:0, y:0, width: 40,height: 40))
        titleView.contentMode = .scaleAspectFit
        titleView.text = "Search"
        navItem.titleView = titleView
    }
    
    private func generateData() {
        let deffaultHero: Hero = Hero(name: "Baba Vova", planet: "Sormovo")
        
        for i in 0...30 {
            heroArray.append(Hero(name: deffaultHero.name+String(i),  planet: deffaultHero.planet+String(i),sex: getRandomSex()))
        }
    }
    
    private func registerTableView() {
        registerTableViewCells()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCells() {
        let cell = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    private func registerSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Heroes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
      filteredHeroes = heroArray.filter { (hero: Hero) -> Bool in
        return hero.name.lowercased().contains(searchText.lowercased())
      }
      tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    private func checkDuplicateData(namePerson: String) ->Bool{
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredHeroes.count: heroArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search results"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            let hero: Hero
            
            hero = isFiltering ? filteredHeroes[indexPath.row] : heroArray[indexPath.row]
            
            cell.cellLabel.text = hero.name
            cell.cellSubLabel.text = hero.planet
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
            
            isFiltering ? heroViewController.sendData(filteredHeroes[indexPath.row]) : heroViewController.sendData(heroArray[indexPath.row])
            
            if checkDuplicateData(namePerson: textName){
                searchController.searchBar.text = ""
                tableView.reloadData()
            }
        }
        navigationController?.pushViewController(heroViewController, animated: true)
    }
}

extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text ?? "")
    }
}
