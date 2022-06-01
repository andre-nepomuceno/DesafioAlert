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
    
    let viewModel: DetalhesFilmeViewModel = DetalhesFilmeViewModel()
    var filme: Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exibeDetalhesDoFilme()
    }
    
    @IBAction func favoritarButtonAction(_ sender: Any) {

    }
    
    func exibeDetalhesDoFilme() {
        tituloLabel.text = self.filme?.titulo
        anoLabel.text = self.filme?.obterAnoLancamento()
        generoLabel.text = self.filme?.obterGenero()
        posterImageView.image = self.filme?.poster
    }
    
    private func alertRemocaoDosFavoritos(filme: Filme) {
        
        let alerta = UIAlertController(title: "", message: "O filme já existe na sua lista de favoritos, deseja removê-lo?", preferredStyle: .alert)
        
        let actionConfirma = UIAlertAction(title: "Sim", style: .default) { action in
            print(action.title!)
        }
        
        let actionCancela = UIAlertAction(title: "Ok Cancel", style: .cancel)
            
        alerta.addAction(actionConfirma)
        alerta.addAction(actionCancela)
            
        present(alerta, animated: true)
    }
    
    private func alertInclusaoNosFavoritos(filme: Filme) {
        
        let alerta = UIAlertController(title: "Favoritos",message: "Deseja realmente incluir o filme em seus favoritos?",preferredStyle: .alert)
        
        let actionConfirma = UIAlertAction(title: "Sim", style: .default) { action in
            self.viewModel.adicionarFilmeAosFavoritos(filme: filme)
        }
        let actionCancela = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alerta.addAction(actionConfirma)
        alerta.addAction(actionCancela)
            
        present(alerta, animated: true)
    }
}
extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
    func confirmarFilmeFavorito(filme: Filme) {
        alertInclusaoNosFavoritos(filme: filme)
    }
    
    func confirmarRemocaoFilme(filme: Filme) {
        alertRemocaoDosFavoritos(filme: filme)
    }
    
    
}
