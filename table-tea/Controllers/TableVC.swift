//
//  TableVC.swift
//  table-tea
//
//  Created by Jaimin Raval on 10/09/24.
//

import UIKit

class TableVC: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var JokesTable: UITableView!
    
    var jokes: [JokeModel] = []
    
    private var selectedJoke : JokeModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        callJokeApi()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }

    
    func callJokeApi() {
        
        loadingIndicator.startAnimating()
        
        ApiManager().fetchJokesAF { result in
            
            switch result {
                
            case .success(let data):
                
                self.jokes.append(contentsOf: data)
                self.JokesTable.reloadData()
                
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
                
            case .failure(let failure):
                
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true

                debugPrint("something went wrong in calling API: \(failure)")
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.JokeDetailSegue {
            
            if let detailVC = segue.destination as? DetailVC {
                
                detailVC.currentJoke = selectedJoke
            }
        }
    }
    
    
//    func saveToUsrDefault(usrName :String) {
//        
//        UserDefaults.standard.set(usrName, forKey: "Usr")
//        
//    }
//    
//    func printUsrDefault() {
//        
//        UserDefaults.standard.value(forKey: "Usr")
//        
//    }
    
    
    
//    func startLoadingIndicator() {
//        
//        DispatchQueue.main.async {
////            self.loadingIndicator.bringSubviewToFront(self.view)
//            self.loadingIndicator.isHidden = false
//            self.loadingIndicator.startAnimating()
//        }
//    }
//    func stopLoadingIndicator() {
//    
//        DispatchQueue.main.async {
////            self.loadingIndicator.bringSubviewToFront(self.view)
//            self.loadingIndicator.isHidden = true
//            self.loadingIndicator.stopAnimating()
//        }
//    }
//    

   
}




extension TableVC: UITableViewDelegate, UITableViewDataSource {

    
    func setupTable() {
        JokesTable.delegate = self
        JokesTable.dataSource = self
        JokesTable.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedJoke = jokes[indexPath.row]
//        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: K.JokeDetailSegue, sender: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.nameLabel.text = jokes[indexPath.row].setup
        cell.subtitleLabel.text = jokes[indexPath.row].punchline
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, source, completion in
            self.jokes.remove(at: indexPath.row)
            self.JokesTable.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [delete])
        swipeConfig.performsFirstActionWithFullSwipe = false
        
        return swipeConfig
    }
    
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            jokes.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        }
    //    }
    
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//    }
    
}
