//
//  FilterData.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct FilterEntry {
    
    let going: Bool
    let name: String
    
    init(name: String, going: Bool = true) {
        self.name = name
        self.going = going
    }
    
}

class FilterData: NSObject {

    static let allData: [FilterEntry] = [
        FilterEntry(name: "Bruno Bilescky"),
        FilterEntry(name: "Tales Pinheiro De Andrade"),
        FilterEntry(name: "John Calistro"),
        FilterEntry(name: "Rodrigo Borges"),
        FilterEntry(name: "Felipe Antonio Cardoso"),
        FilterEntry(name: "Rodrigo Peixoto"),
        FilterEntry(name: "Edgar Costa Cardoso"),
        FilterEntry(name: "Carl Brusell"),
        FilterEntry(name: "Joaquim Pessoa Filho"),
        FilterEntry(name: "Inácio Ferrarini"),
        FilterEntry(name: "Vinicius Carvalho Marques"),
        FilterEntry(name: "Ezequiel França"),
        FilterEntry(name: "Diego Caxito"),
        FilterEntry(name: "Erick Emiliano"),
        FilterEntry(name: "Tércio Leal da Silva"),
        FilterEntry(name: "Bruno Mazzo"),
        FilterEntry(name: "Alessandro­ Ferreira Pereira"),
        FilterEntry(name: "Emannuel Carvalho"),
        FilterEntry(name: "Flávio Fraschetti­"),
        FilterEntry(name: "Eduardo Lino"),
        FilterEntry(name: "Leonardo Oliveira"),
        FilterEntry(name: "Marcos Vinicius Souza Lacerda"),
        FilterEntry(name: "Robinson Nakamura"),
        FilterEntry(name: "Marcelo Reis"),
        FilterEntry(name: "Diogo Tridapalli­"),
        FilterEntry(name: "Flávio J Vieira Caetano"),
        FilterEntry(name: "Alexandre Alencar Santos"),
        FilterEntry(name: "André Dias"),
        FilterEntry(name: "Bruno Fernandes"),
        FilterEntry(name: "Raphael Souza"),
        FilterEntry(name: "Douglas Garcia"),
        FilterEntry(name: "Henrique José Pires Barcelos"),
        FilterEntry(name: "Samuel Dias"),
        FilterEntry(name: "Maurício Cardozo"),
        FilterEntry(name: "rafael malheiros"),
        FilterEntry(name: "Ricardo Bailoni"),
        FilterEntry(name: "Mauricio Lima"),
        FilterEntry(name: "Rodrigo Carneiro"),
        FilterEntry(name: "Felipe Weckx"),
        FilterEntry(name: "Emerson Moura"),
        FilterEntry(name: "Philipe Araujo"),
        FilterEntry(name: "João Marcos Ribeiro Araújo"),
        FilterEntry(name: "Evandro Viva"),
        FilterEntry(name: "Bruno Faganello"),
        FilterEntry(name: "Matheus Amancio"),
        FilterEntry(name: "Joao"),
        FilterEntry(name: "Nicolai Diniz"),
        FilterEntry(name: "Thiago"),
        FilterEntry(name: "Winny Pina"),
        FilterEntry(name: "André Gimenez Faria"),
        FilterEntry(name: "Glauco Moraes"),
        FilterEntry(name: "Fabio Luiz Fonseca"),
        FilterEntry(name: "Roberto Junior"),
        FilterEntry(name: "Gláucia Isidoro"),
        FilterEntry(name: "Alex Felippe Chiozo"),
        FilterEntry(name: "Frederico Moreira"),
        FilterEntry(name: "Fernando Mohara"),
        FilterEntry(name: "David Batista da Silva"),
        FilterEntry(name: "Leonardo Sousa"),
        FilterEntry(name: "Gabriel Vieira"),
        FilterEntry(name: "Pedro Silva"),
        FilterEntry(name: "Ricieri Garcez Rosa"),
        FilterEntry(name: "Fernando França", going: false),
        FilterEntry(name: "Daniel Costa", going: false),
        FilterEntry(name: "Flávio Garrido", going: false),
        FilterEntry(name: "Eduardo Quadros", going: false),
        FilterEntry(name: "Adriano Mazucato", going: false),
        FilterEntry(name: "Leandro Amaral Pereira", going: false)
    ]
    
    static func filteredData(by value: String, going: Bool?)-> [FilterEntry] {
        guard value.characters.count > 0 else {
            if let going = going {
                return allData.filter({ (entry) -> Bool in
                    return entry.going == going
                })
            }
            return allData
        }
        return allData.filter({ (entry) -> Bool in
            let nsString = entry.name as NSString
            let matchName = nsString.localizedCaseInsensitiveContains(value)
            if let going = going {
                return matchName && entry.going == going
            }
            return matchName
        })
    }
    
}
