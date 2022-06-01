//
//  FilmeViewModel.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import Foundation
import UIKit

protocol FilmeViewModelDelegate {
    
    func exibeDetalhesDoFilme(filme: Filme)
    
    func pararCarregamento()
    
    func exibeTelaDeDetalhes(tela: DetalhesFilmeViewController, filme: Filme)
}

class FilmeViewModel {
    
    var delegate: FilmeViewModelDelegate?
    
    var service: Service = Service()
    
    var filmes: [Filme] = []
    
    init() {
        
    }
    
    func buscarFilmes() {
        service.obterTodosOsFilmes { listaDeFilmes in
            self.filmes = listaDeFilmes
            self.delegate?.pararCarregamento()
        }
    }
    
    func carregaTelaDetalhes(telaDetalhes: UIViewController, sender: Any?) {
        guard let telaDetalhes = telaDetalhes as? DetalhesFilmeViewController else { return }
        guard let filme = sender as? Filme else {
            return
        }
        delegate?.exibeTelaDeDetalhes(tela: telaDetalhes, filme: filme)
        //telaDetalhes.exibeDetalhesDoFilme(filme: filme)
    }
    
    func buscarFilmePor(posicao: Int) {
        service.obterFilmePor(posicao: posicao) { filme in
            if let filme = filme {
                self.delegate?.exibeDetalhesDoFilme(filme: filme)
            }
        }
    }
    
    func buscarQuantidadeDeFilmes() -> Int {
        return filmes.count
    }
    
    func retornaListaDeFilmes() -> [Filme] {
        return filmes
    }
}
