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
    var service: Service
    var usuario: Usuario?
    var filme: Filme
    
    init(service: Service, filme: Filme) {
        self.service = service
        self.filme = filme
    }
    
    func getFilme() -> Filme {
        return filme
    }
    
    func adicionarFilmeAosFavoritos(filme: Filme) {
        usuario?.adicionarFilmeAosFavoritos(filme: filme)
    }
    
    func removerFilmeDosFavoritos(filme: Filme) {
        usuario?.removerFilmeDosFavoritos(filme: filme)
    }
    
    func favoritarFilme()  {
        service.obterUsuarioLogado { usuarioLogado in
            self.usuario = usuarioLogado
            let filmePertence = usuarioLogado.filmesFavoritos.contains(where: { filmeFavorito in
                filmeFavorito.titulo == self.filme.titulo
            })
            if filmePertence {
                self.delegate?.confirmarRemocaoFilme(filme: self.filme)
            }
            else {
                self.delegate?.confirmarFilmeFavorito(filme: self.filme)
            }
        }
    }
}
