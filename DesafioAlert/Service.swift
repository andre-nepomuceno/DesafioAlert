//
//  Service.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import Foundation

class Service {
    
    private var listaDeFilmes: [Filme] = []
    
    init() {
        listaDeFilmes = Filme.criarFilmesDeTerror()
    }
    
    private static var usuarioLogado: Usuario = Usuario(nome: "Andre")
    
    func obterTodosOsFilmes(completion: @escaping ([Filme]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(self.listaDeFilmes)
        }
    }
    
    func obterFilmePor(posicao: Int, completion: @escaping (Filme?) -> Void) {
        let filmeEscolhido = listaDeFilmes[posicao]

        let tempoDeEspera = DispatchTime.now().advanced(by: .seconds(10));
        DispatchQueue.main.asyncAfter(deadline: tempoDeEspera) {
            completion(filmeEscolhido)
        }
    }
    
    func obterUsuarioLogado() -> Usuario {
        return Service.usuarioLogado
    }

    //    func obterFilmePor(titulo: String?, completion: @escaping (Filme?) -> Void) {
    //        guard let titulo = titulo else { return }
    //        let tempoDeEspera = DispatchTime.now().advanced(by: .seconds(10));
    //
    //        let filmeEscolhido = buscarFilmeNaListaPor(titulo: titulo)
    //
    //        DispatchQueue.main.asyncAfter(deadline: tempoDeEspera) {
    //            completion(filmeEscolhido)
    //        }
    //    }

    
//    private func buscarFilmeNaListaPor(titulo: String) -> Filme? {
//        return listaDeFilmes.first { filme in
//            filme.titulo == titulo
//        }
//    }

}
