//
//  DetalhesFilmeViewModel.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 31/05/22.
//

import Foundation

protocol DetalhesFilmeViewModelDelegate {
    
    func confirmarFilmeFavorito(filme: Filme)
    
    func confirmarRemocaoFilme(filme: Filme)
}

class DetalhesFilmeViewModel {
    
    var delegate: DetalhesFilmeViewModelDelegate?
    
    func adicionarFilmeAosFavoritos(filme: Filme) {
        
    }
    
    func removerFilmeDosFavoritos(filme: Filme) {
        
    }
}
