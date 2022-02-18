//
//  PokemonRowView.swift
//  Pokepex
//
//  Created by Jordy Gracia on 07/02/22.
//

import UIKit

public class PokemonRowView: UIView {
    var id: Int?
    var name: String?
    
    private lazy var headerLabel: UILabel = {
        [weak self] in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("Fatal error ocurred")
    }
    
    convenience init(id: Int, name: String) {
        self.init(frame: .zero)
        
        self.id = id
        self.name = name
        
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
