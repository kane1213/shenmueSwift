import UIKit

class ViewController: UIViewController {
    var mainScroll:UIScrollView!
    let numOfChapter = 6
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScroll = UIScrollView()
        view.addSubview(mainScroll)
        mainScroll.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 1...numOfChapter {
            generateImageView("chapter\(i)")
        }
        
        mainScroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        mainScroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScroll.backgroundColor = UIColor.darkGray
        mainScroll.isPagingEnabled = true
        
    }
    
    func generateImageView(_ name:String) {
        let imgView: UIImageView = UIImageView(image: UIImage(named: name))
        mainScroll.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        //horizonImage(imgView)
        verticalImage(imgView)
        
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.pickPort(sender:)))
        
        //let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectPort(sender:)))
        
        //imgView.tag = imageViews.count + 1
        imgView.addGestureRecognizer(gesture)
        imgView.isUserInteractionEnabled = true
        imgView.contentMode = .scaleAspectFit
    }
    
    func verticalImage (_ imgView:UIImageView) {
        
        imgView.leadingAnchor.constraint(equalTo: mainScroll.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: mainScroll.trailingAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: mainScroll.widthAnchor).isActive = true
        if let imgHgt = imgView.image?.cgImage?.height, let imgWdt = imgView.image?.cgImage?.width {
            imgView.heightAnchor.constraint(equalToConstant: CGFloat(UIScreen.main.bounds.width) / CGFloat(imgWdt) * CGFloat(imgHgt)).isActive = true
        }
        
        
        
        if mainScroll.subviews.count == 1 {
            imgView.topAnchor.constraint(equalTo: mainScroll.topAnchor).isActive = true
        } else {

            imgView.topAnchor.constraint(equalTo: mainScroll.subviews[mainScroll.subviews.count - 2].bottomAnchor, constant: 10).isActive = true
            if mainScroll.subviews.count == numOfChapter {
                imgView.bottomAnchor.constraint(equalTo: mainScroll.bottomAnchor).isActive = true
            }
        }
    }
    
    func horizonImage (_ imgView:UIImageView) {
        imgView.topAnchor.constraint(equalTo: mainScroll.topAnchor).isActive = true
        imgView.heightAnchor.constraint(equalTo: mainScroll.heightAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: mainScroll.widthAnchor).isActive = true
        if mainScroll.subviews.count == 1 {
            imgView.leadingAnchor.constraint(equalTo: mainScroll.leadingAnchor).isActive = true
        } else {
            imgView.leadingAnchor.constraint(equalTo: mainScroll.subviews[mainScroll.subviews.count - 2].trailingAnchor).isActive = true
            if mainScroll.subviews.count == numOfChapter {
                imgView.trailingAnchor.constraint(equalTo: mainScroll.trailingAnchor).isActive = true
            }
        }
    }
    
    @objc func pickPort(sender: UITapGestureRecognizer) {
        //sender.view
        if let pickView = sender.view {
            
            let pickIdx = mainScroll.subviews.index(of: pickView)
            let destinationViewController: UIViewController!
            if pickIdx == 0 {
                destinationViewController = TableViewController()
            } else {
                destinationViewController = CollectionViewController()
            }
            
            let objNavi = UINavigationController(rootViewController: destinationViewController)
            objNavi.navigationBar.prefersLargeTitles = true
            present(objNavi, animated: true, completion: {})
            
        }
    }
}

