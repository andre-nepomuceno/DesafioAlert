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
        configuraActivity()
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        iniciaAnimacaoActivity()
        viewModel.buscarFilmes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewModel.carregaTelaDetalhes(telaDetalhes: segue.destination, sender: sender)
        finalizaAnimacaoActivity()
    }
    
    private func iniciaAnimacaoActivity() {
        activity.startAnimating()
        activity.isHidden = false
    }
    
    private func finalizaAnimacaoActivity() {
        activity.stopAnimating()
        activity.isHidden = true
    }
    private func configuraActivity() {
        activity.color = .red
        activity.style = .large
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.retornaListaDeFilmes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let filme = viewModel.retornaListaDeFilmes()[indexPath.row]
        cell.imageView?.image = UIImage(named: filme.poster)
        cell.textLabel?.text = filme.titulo
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        iniciaAnimacaoActivity()
        viewModel.buscarFilmePor(posicao: indexPath.row)
    }
}

extension ViewController: FilmeViewModelDelegate {
    
    func exibeDetalhesDoFilme(filme: Filme) {
        performSegue(withIdentifier: "detalhesFilmeSegue", sender: filme)
    }
    
    func pararCarregamento() {
        self.tableView.reloadData()
        finalizaAnimacaoActivity()
    }
    
    
}
