//
//  ViewController.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 15/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var heroArray:[Hero] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchView.configure(titleText: "Search")
        let deffaultHero: Hero = Hero(name: "Baba", surname: "Vova", planet: "Sormovo")
        
        for i in 0...20 {
            heroArray.append(Hero(name: deffaultHero.name+String(i), surname:deffaultHero.surname+String(i), planet: deffaultHero.planet+String(i)))
        }
    
        registerTableViewCells()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCells (){
        let cell = UINib(nibName: "SearchTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    
    private func checkDuplicateData(namePerson: String) ->Bool{
//        let result = data.filter({
//            $0 != namePerson
//        })
//        if result.count == data.count{
//            return true
//        } else{
//            return false
//        }
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    //Создание кастомной ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            cell.cellLabel.text = heroArray[indexPath.row].name + heroArray[indexPath.row].surname
            return cell
        }
        return UITableViewCell()
    }
    
    //Нажатие на ячейку таблицы переход к экрану детайльной информации
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let StatViewController = storyboard.instantiateViewController(withIdentifier: "Stat") as? RequestController else {return}
//
//        self.tableView.cellForRow(at: indexPath)?.isSelected = false
//
//        if let cell = self.tableView.cellForRow(at: indexPath) as? CustomTableViewCell{
//            guard let textName = cell.textLabelPerson.text else { return }
//            StatViewController.sendData(parseRequest(namePerson: textName))
//
//            if checkDuplicateData(namePerson: textName){
//                data.append(textName)
//                searchBar.text = nil
//                filteredData = data
//                tableView.reloadData()
//            }
//        }
//        navigationController?.pushViewController(StatViewController, animated: true)
//    }


}

