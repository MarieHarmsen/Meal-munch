import UIKit

class HomeTableViewController: UITableViewController, HomeViewModelDelegate {
    private var sharedAppearance = AppearanceHandler()
    private var viewModelDelegate: HomeViewModelDelegate?
    private var viewModel: HomeTableViewModel?

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
        let cellNib = UINib(nibName: "ImageViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "ImageViewCell")
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
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
        let topInset = 10
        tableView.contentInset.top = CGFloat(topInset)
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
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView
        header?.configure(title: viewModel?.getMealTitle(index: section), subTitle: "")
        return header
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionIndex = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as? ImageViewCell
        cell?.contentView.layer.cornerRadius = 0
        cell?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell?.configure(imageURL: (viewModel?.getMealImageURL(index: sectionIndex) ?? URL(string:""))!)
        return cell ?? UITableViewCell()
    }

    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Constants().rowHeight)
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let headerView = view as? UITableViewHeaderFooterView
        headerView?.contentView.layer.cornerRadius = CGFloat(Constants().cornerRadius)
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

