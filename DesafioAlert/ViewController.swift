//
//  ViewController.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    let viewModel: FilmeViewModel = FilmeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.color = .blue
        activity.style = .large
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        activity.startAnimating()
        activity.isHidden = false
        
        viewModel.buscarFilmes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewModel.carregaTelaDetalhes(telaDetalhes: segue.destination, sender: sender)
        activity.stopAnimating()
        activity.isHidden = true
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.retornaListaDeFilmes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let filme = viewModel.retornaListaDeFilmes()[indexPath.row]
        cell.imageView?.image = filme.poster
        cell.textLabel?.text = filme.titulo
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activity.startAnimating()
        activity.isHidden = false
        viewModel.buscarFilmePor(posicao: indexPath.row)
    }
}

extension ViewController: FilmeViewModelDelegate {
    
    func exibeDetalhesDoFilme(filme: Filme) {
        performSegue(withIdentifier: "detalhesFilmeSegue", sender: filme)
    }
    
    func pararCarregamento() {
        self.tableView.reloadData()
        activity.stopAnimating()
        activity.isHidden = true
    }
    
    
}
