//
//  OverviewMonumentDetailTableViewCell.swift
//  Borodino
//
//  Created by Александр Прайд on 23.06.2022.
//

import UIKit

class OverviewMonumentDetailTableViewCell: UITableViewCell {

    
    static var resuedIdentifire = "OverviewMonumentDetailTableViewCell"
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "С командного пункта император Наполеон Бонапарт руководил своими войсками в день Бородинского сражения. Если посмотреть с этого места на восток, в сторону позиций русской армии, то невольно возникает вопрос: что же император французов мог видеть отсюда?\n\nЗа прошедшие два столетия ландшафт поля сражения, конечно же, изменился. Разрослись леса, возникли заросли и перелески. В 1812 году местность, где разыгралось одно из величайших сражений XIX века, была более открытой. Это хорошо видно на большом макете поля сражения, который экспонируется в главной экспозиции музея-заповедника «Славься ввек, Бородино!». С этого места Наполеон наблюдал не только за ходом боя за Семёновские (или Багратионовы) флеши, но и за атаками на Батарею Раевского в центре поля. Отсюда были видны и главки церкви в селе Бородино. 100 лет спустя после сражения правительство Франции просит разрешения русского правительства поставить на месте командного пункта Наполеона памятник всем французским воинам, погибшим в сражении. Памятник «Павшим Великой армии» был изготовлен во Франции по проекту известного архитектора и скульптора Бесвильва́льда на средства, собранные по подписке среди населения Французской республики. Гранитные блоки монумента перевозили морским путем в Петербург, а затем по железной дороге собирались доставить в Бородино. Но, по воле случая, пароход, перевозивший памятник, затонул во время шторма в Северном море. В августе 1912 года все же состоялось открытие временного памятника, наскоро изготовленного из дерева и облицованного гипсом, тонированным под серый гранит. Год спустя, в 1913 году, временный памятник был заменен на вновь изготовленный, из воге́зского гранита. Его доставили из Франции в Бородино по железной дороге."
        label.textColor = .white
        label.textAlignment = .natural
        label.font = UIFont(name: "Helvetica Neue", size: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(overviewLabel)
        applyConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }

}
