//
//  TestMonumentDetailViewController.swift
//  Borodino
//
//  Created by Александр Прайд on 21.06.2022.
//

import UIKit

class TestMonumentDetailViewController: UIViewController {
    
    
    private var gallery: [MGallery] = [MGallery]()

    private let monumentDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "46m")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentDetailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Место командного пункта Наполеона. Памятник «Мертвым Великой армии»"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monumentDetailIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        imageView.tintColor = .mainGold()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentDetailAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Московская область, Можайский городской округ, деревня Шевардино"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monumentDetailSourceIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.columns.circle")
        imageView.tintColor = .mainGold()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let monumentDetailSourceLabel: UILabel = {
        let label = UILabel()
        label.text = "Бородинский Музей-Заповедник"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monumentDetailOverviewLabel: UILabel = {
        let label = UILabel()
        label.text = "С командного пункта император Наполеон Бонапарт руководил своими войсками в день Бородинского сражения. Если посмотреть с этого места на восток, в сторону позиций русской армии, то невольно возникает вопрос: что же император французов мог видеть отсюда?\n\nЗа прошедшие два столетия ландшафт поля сражения, конечно же, изменился. Разрослись леса, возникли заросли и перелески. В 1812 году местность, где разыгралось одно из величайших сражений XIX века, была более открытой. Это хорошо видно на большом макете поля сражения, который экспонируется в главной экспозиции музея-заповедника «Славься ввек, Бородино!». С этого места Наполеон наблюдал не только за ходом боя за Семёновские (или Багратионовы) флеши, но и за атаками на Батарею Раевского в центре поля. Отсюда были видны и главки церкви в селе Бородино. 100 лет спустя после сражения правительство Франции просит разрешения русского правительства поставить на месте командного пункта Наполеона памятник всем французским воинам, погибшим в сражении. Памятник «Павшим Великой армии» был изготовлен во Франции по проекту известного архитектора и скульптора Бесвильва́льда на средства, собранные по подписке среди населения Французской республики. Гранитные блоки монумента перевозили морским путем в Петербург, а затем по железной дороге собирались доставить в Бородино. Но, по воле случая, пароход, перевозивший памятник, затонул во время шторма в Северном море. В августе 1912 года все же состоялось открытие временного памятника, наскоро изготовленного из дерева и облицованного гипсом, тонированным под серый гранит. Год спустя, в 1913 году, временный памятник был заменен на вновь изготовленный, из воге́зского гранита. Его доставили из Франции в Бородино по железной дороге."
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
//    func configure(with model: MonumentViewModel) {
//        monumentDetailImageView.image = UIImage(named: model.image ?? "photo")
//        monumentDetailTitleLabel.text = model.title
//        monumentDetailAddressLabel.text = model.emblem
//        monumentDetailSourceLabel.text = model.years
//        monumentDetailOverviewLabel.text = model.overview
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
