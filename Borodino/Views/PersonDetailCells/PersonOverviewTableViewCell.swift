//
//  PersonOverviewTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 25.06.2022.
//

import UIKit

class PersonOverviewTableViewCell: UITableViewCell {

    static let reusedID = K.Person.overviewReusedId

    let personOverviewLabel: UILabel = {
        let label = UILabel()
        label.text = "В Русской кампании 1812 года командовал корпусом. На время занятия Москвы штаб и квартира маршала разместились в усадьбе Кусково. После оккупации Москвы занимал Богородск, а его разъезды доходили до реки Дубны. \n\n Во время отступления из России, после сражения при Вязьме, встал во главе арьергарда, сменив корпус маршала Даву. После отступления главных сил Великой Армии из Смоленска прикрывал её отход и распоряжался подготовкой укреплений Смоленска к подрыву. Промедлив с отступлением, он был отрезан от Наполеона русскими войсками под началом М. А. Милорадовича. Он пытался пробиться, но, понеся большие потери, не смог осуществить своего намерения, отобрал лучшие части корпуса числом около 3 тысяч солдат и с ними перешёл Днепр севернее, у деревни Сырокоренье, бросив большую часть своих войск (в том числе всю артиллерию), которые на следующий день капитулировали. У Сырокоренья войска Нея перебирались через Днепр по тонкому льду; на участки открытой воды бросали доски. Значительная часть солдат при переходе через реку утонула, так что когда Ней соединился у Орши с главными силами, в его отряде оставалось лишь около 500 человек. С железной строгостью поддерживал он дисциплину, при переходе через Березину спас остатки войска. При отступлении остатков Великой армии руководил обороной Вильны и Ковно. \n\n Наполеон называл его «le Brave des Braves» — «храбрейший из храбрых»."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Romans", size: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    func configure(with value: MGallery) {
//        personOverviewLabel.text = value.overview
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(personOverviewLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            personOverviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            personOverviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            personOverviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            personOverviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        
        ])
        
    }
}
