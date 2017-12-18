import UIKit

class ViewController: UIViewController {

    public let title1FontSize: CGFloat = 28

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .stone
        label.text = "Selger min bestemors gamle sykkel. Den er godt brukt, fungerer godt. Jeg har byttet slange, men latt være å gjøre noe mer på den. Du som kjøper den kan fikse den opp akkurat som du vil ha den :) Jeg ville aldri kjøpt den, men jeg satser på at du er dum nok til å bare gå for det."
        return label
    }()

    lazy var showWholeDescriptionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = true
        button.setTitleColor(.primaryBlue, for: .normal)
        button.setTitle("+ Vis hele beskrivelsen", for: .normal)
        button.addTarget(self, action: #selector(showWholeDescriptionAction), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isAccessibilityElement = true
        label.textColor = .primaryBlue
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Møbler oginteriør / Sofaer og lenestoler / Sofagrupper"
        label.numberOfLines = 2
        return label
    }()

    lazy var adCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "adCell")
        return imageView
    }()

    lazy var safePayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = true
        button.setTitleColor(.primaryBlue, for: .normal)
        button.setTitle("FINN Trygg betaling", for: .normal)
        button.addTarget(self, action: #selector(safePayTapped), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()

    lazy var loanPriceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = true
        button.setTitleColor(.primaryBlue, for: .normal)
        button.setTitle("Pris på lån", for: .normal)
        button.addTarget(self, action: #selector(loanPriceTapped), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()

    lazy var deliveryHelpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "deliveryHelp")
        return imageView
    }()

    lazy var adReporterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = true
        button.setTitleColor(.primaryBlue, for: .normal)
        button.setTitle("Rapporter svindel/regelbrudd", for: .normal)
        button.addTarget(self, action: #selector(adReporterTapped), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()

    lazy var finnCodeInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .stone
        label.text = "FINN-kode"
        return label
    }()

    lazy var lastEditedInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .stone
        label.text = "Sist endret"
        return label
    }()

    lazy var finnCodeContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .stone
        label.text = "145789632"
        return label
    }()

    lazy var lastEditedContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .stone
        label.text = "24. nov 2017 14:04"
        return label
    }()

    lazy var leftAdInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [finnCodeInfoLabel, lastEditedInfoLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = .smallSpacing
        return stackView
    }()

    lazy var rightAdInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [finnCodeContentLabel, lastEditedContentLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = .smallSpacing
        return stackView
    }()

    lazy var adInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftAdInfoStackView, rightAdInfoStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = .mediumSpacing
        return stackView
    }()

    lazy var relevantAdsFeedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "relevantAdsFeed")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        let galleryView = GalleryView()
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(galleryView)

        let titleView = TitleView()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleView)

        let priceView = PriceView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceView)

        let messageButton = MessageButtonView()
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageButton)

        let showNumberButton = ShowNumberButtonView()
        showNumberButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(showNumberButton)

        let profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileView)

        let adressView = AdressView()
        adressView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(adressView)

        contentView.addSubview(descriptionLabel)
        contentView.addSubview(showWholeDescriptionButton)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(adCellImageView)
        contentView.addSubview(safePayButton)
        contentView.addSubview(loanPriceButton)
        contentView.addSubview(deliveryHelpImageView)
        contentView.addSubview(adReporterButton)
        contentView.addSubview(adInfoStackView)
        contentView.addSubview(relevantAdsFeedImageView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            galleryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .mediumLargeSpacing),
            galleryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            galleryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),
            galleryView.heightAnchor.constraint(equalToConstant: 330),

            titleView.topAnchor.constraint(equalTo: galleryView.bottomAnchor, constant: .mediumLargeSpacing),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            priceView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: .mediumSpacing),
            priceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            priceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            messageButton.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: .mediumLargeSpacing),
            messageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            messageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            showNumberButton.topAnchor.constraint(equalTo: messageButton.bottomAnchor, constant: .smallSpacing),
            showNumberButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            profileView.topAnchor.constraint(equalTo: showNumberButton.bottomAnchor, constant: .smallSpacing),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),
            profileView.heightAnchor.constraint(equalToConstant: 125),

            adressView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: .mediumSpacing),
            adressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            descriptionLabel.topAnchor.constraint(equalTo: adressView.bottomAnchor, constant: .mediumLargeSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            showWholeDescriptionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .mediumSpacing),
            showWholeDescriptionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            categoryLabel.topAnchor.constraint(equalTo: showWholeDescriptionButton.bottomAnchor, constant: .mediumSpacing),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            adCellImageView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: .mediumSpacing),
            adCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adCellImageView.heightAnchor.constraint(equalToConstant: 400),

            safePayButton.topAnchor.constraint(equalTo: adCellImageView.bottomAnchor, constant: .mediumSpacing),
            safePayButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            loanPriceButton.topAnchor.constraint(equalTo: safePayButton.topAnchor),
            loanPriceButton.leadingAnchor.constraint(equalTo: safePayButton.trailingAnchor, constant: .mediumLargeSpacing),

            deliveryHelpImageView.topAnchor.constraint(equalTo: safePayButton.bottomAnchor, constant: .mediumSpacing),
            deliveryHelpImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            deliveryHelpImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),

            adReporterButton.topAnchor.constraint(equalTo: deliveryHelpImageView.bottomAnchor, constant: .mediumSpacing),
            adReporterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            adInfoStackView.topAnchor.constraint(equalTo: adReporterButton.bottomAnchor, constant: .mediumLargeSpacing),
            adInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),

            relevantAdsFeedImageView.topAnchor.constraint(equalTo: adInfoStackView.bottomAnchor, constant: .mediumSpacing),
            relevantAdsFeedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .mediumLargeSpacing),
            relevantAdsFeedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.mediumLargeSpacing),
            relevantAdsFeedImageView.heightAnchor.constraint(equalToConstant: 650),
            relevantAdsFeedImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }

    @objc func showWholeDescriptionAction(sender: UIButton) {
        if descriptionLabel.numberOfLines >= 5 {
            print("Vis hele beskrivelsen!")
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
                self.showWholeDescriptionButton.setTitle("- Vis mindre", for: .normal)
                self.descriptionLabel.numberOfLines = 0
                self.descriptionLabel.sizeToFit()
            }, completion: nil)
        } else {
            print("Vis mindre av beskrivelsen!")
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
                self.showWholeDescriptionButton.setTitle("+ Vis hele beskrivelsen", for: .normal)
                self.descriptionLabel.numberOfLines = 5
                self.descriptionLabel.sizeToFit()
            }, completion: nil)
        }
    }
    @objc func safePayTapped(sender: UIButton) {
        print("Safe Pay")
    }
    @objc func loanPriceTapped(sender: UIButton) {
        print("Loan price")
    }
    @objc func adReporterTapped(sender: UIButton) {
        print("Reporting ad")
    }
}
