//
//  DetalhesFilmeViewController.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 31/05/22.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {

    
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: DetalhesFilmeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        activityIndicator.color = .blue
        activityIndicator.style = .large
        activityIndicator.isHidden = true
        exibeDetalhesDoFilme()
    }
    
    @IBAction func favoritarButtonAction(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel?.favoritarFilme()
    }
    
    func exibeDetalhesDoFilme() {
        let filme = viewModel?.getFilme()
        tituloLabel.text = filme?.titulo
        anoLabel.text = filme?.obterAnoLancamento()
        generoLabel.text = filme?.obterGenero()
        posterImageView.image = filme?.poster
    }
    
    private func alertRemocaoDosFavoritos(filme: Filme) {
        
        let alerta = UIAlertController(title: "", message: "O filme \(filme.titulo) já existe na sua lista de favoritos, deseja removê-lo?", preferredStyle: .alert)
        
        let actionConfirma = UIAlertAction(title: "Sim", style: .default) { action in
            self.viewModel?.removerFilmeDosFavoritos(filme: filme)
            print("Removido")
        }
        
        let actionCancela = UIAlertAction(title: "Cancelar", style: .cancel)
            
        alerta.addAction(actionConfirma)
        alerta.addAction(actionCancela)
            
        present(alerta, animated: true)
    }
    
    private func alertInclusaoNosFavoritos(filme: Filme) {
        
        let alerta = UIAlertController(title: "Favoritos",message: "Deseja realmente incluir o filme \(filme.titulo) em seus favoritos?",preferredStyle: .alert)
        
        let actionConfirma = UIAlertAction(title: "Sim", style: .default) { action in
            self.viewModel?.adicionarFilmeAosFavoritos(filme: filme)
            print("Adicionado")
        }
        let actionCancela = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alerta.addAction(actionConfirma)
        alerta.addAction(actionCancela)
            
        present(alerta, animated: true)
    }
}
extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
    func confirmarFilmeFavorito(filme: Filme) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        alertInclusaoNosFavoritos(filme: filme)
    }
    
    func confirmarRemocaoFilme(filme: Filme) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        alertRemocaoDosFavoritos(filme: filme)
    }
    
    
}
