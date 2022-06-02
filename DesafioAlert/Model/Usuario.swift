//
//  Usuario.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 31/05/22.
//

import Foundation

class Usuario {
    init(nome: String) {
        self.nome = nome
    }
    
    let nome: String
    var filmesFavoritos: [Filme] = []
    
    func adicionarFilmeAosFavoritos(filme: Filme) {
        filmesFavoritos.append(filme)
    }
    
    func removerFilmeDosFavoritos(filme: Filme) {
        guard let posicao = retornaPosicaoDoFilmeNaListaDeFavoritos(filme: filme) else { return }
        filmesFavoritos.remove(at: posicao)
    }
    
    func retornaPosicaoDoFilmeNaListaDeFavoritos(filme: Filme) -> Int? {
        return filmesFavoritos.firstIndex { filmeDaLista in
            filmeDaLista.titulo == filme.titulo
        }
    }
}
