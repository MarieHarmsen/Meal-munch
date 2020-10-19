import UIKit

class HomeTableViewController: UITableViewController, HomeViewModelDelegate {
    private var sharedAppearance = AppearanceHandler()
    private var viewModelDelegate: HomeViewModelDelegate?
    private var viewModel: HomeTableViewModel?
    private let constants = Constants()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelDelegate = self
        viewModel = HomeTableViewModel(with: viewModelDelegate)
        self.getData()
    }

    func setUp() {
        registerViews()
        setUpViews()
    }

    func registerViews() {
        let searchCellNib = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(searchCellNib, forCellReuseIdentifier: "SearchCell")
        let imageCellNib = UINib(nibName: "ImageViewCell", bundle: nil)
        self.tableView.register(imageCellNib, forCellReuseIdentifier: "ImageViewCell")
        let headerNib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }

    func setUpViews() {
        self.title = CommonStrings.appTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: sharedAppearance.headingText]
        let rightButtonItem = UIBarButtonItem.init(
              title: CommonStrings.credits,
              style: .done,
              target: self,
              action: #selector(rightButtonAction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationController?.navigationBar.tintColor = sharedAppearance.mainColour
    }

    @objc func rightButtonAction(sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "CreditViewController", bundle: nil)
            guard let creditViewController = storyBoard.instantiateViewController(withIdentifier: "CreditViewController") as? CreditViewController else { return }
                self.present(creditViewController, animated: true, completion: nil)
        }
    }

    func getData() {
        self.viewModel?.getData()
        self.setUp()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getSectionCount() ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView
            header?.configure(title: viewModel?.getMealTitle(index: section), subTitle: "")
            return header
        }
        return UIView()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionIndex = indexPath.section
        if sectionIndex == 0 {
            return createSearchCell() ?? UITableViewCell()
        }
        return createImageCell(sectionIndex: sectionIndex) ?? UITableViewCell()
    }

    func createSearchCell() -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell
        if let viewModel = viewModel {
            cell?.configure(viewDelegate: viewModel)
        }
        return cell
    }

    func createImageCell(sectionIndex: Int) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as? ImageViewCell
        cell?.contentView.layer.cornerRadius = 0
        cell?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        guard let imageUrl = viewModel?.getMealImageURL(index: sectionIndex) else { return UITableViewCell() }
        cell?.configure(imageURL: imageUrl)
        return cell
    }

    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : CGFloat(constants.rowHeight)
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let headerView = view as? UITableViewHeaderFooterView
        headerView?.contentView.layer.cornerRadius = CGFloat(constants.cornerRadius)
        headerView?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

//MARK: Delegate
extension HomeTableViewController {
    func navigateToErrorScreen() {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "GenericScreenWithImage", bundle: nil)
            guard let errorViewController = storyBoard.instantiateViewController(withIdentifier: "GenericScreenWithImage") as? GenericScreenWithImageViewController else { return }
                self.present(errorViewController, animated: true, completion: nil)
            errorViewController.configure(imageName: "ErrorImage", description: CommonStrings.errorDescription)
        }
    }

    func showLoadingScreen() {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "GenericScreenWithImage", bundle: nil)
            guard let errorViewController = storyBoard.instantiateViewController(withIdentifier: "GenericScreenWithImage") as? GenericScreenWithImageViewController else { return }
                self.present(errorViewController, animated: true, completion: nil)
            errorViewController.configure(imageName: "LoadingImage", description: CommonStrings.loading)
        }
    }

    func dismissLoadingScreen() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }

    func reloadTable() {
        self.tableView.reloadData()
    }
}

