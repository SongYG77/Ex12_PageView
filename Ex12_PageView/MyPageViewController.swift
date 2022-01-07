//
//  MyPageViewController.swift
//  Ex12_PageView
//
//  Created by 송윤근 on 2022/01/07.
//

import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.pageVC = self
        
        self.dataSource = self
        self.delegate = self

     
        if let firstVC = viewcontrollerList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //레이지 변수는 선언시에 메모리 할당을 하지 않고 참조시에 메모리를 할당.(뷰 객체들이 다 생성이 되고 나서 가져와야하기 때문.
    lazy var viewcontrollerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(identifier: "firstVC")
        let vc2 = sb.instantiateViewController(identifier: "secondVC")
        let vc3 = sb.instantiateViewController(identifier: "thirdVC")
        
        return [vc1, vc2, vc3]
    }()
    
    
    // MARK: - 데이터 소스를 받는 부분
    //앞으로 갈때 코드
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewcontrollerList.firstIndex(of: viewController)
        else{
            return nil
        }
        
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return viewcontrollerList[previousIndex]
    }
    
    
    //뒤로 갈때 코드
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewcontrollerList.firstIndex(of: viewController)
        else{
            return nil
        }
        
        let afterIndex = vcIndex + 1
        guard viewcontrollerList.count != afterIndex else {
            return nil
        }
        return viewcontrollerList[afterIndex]
        
    }
    
    //코드로 페이지 뷰 컨트롤러를 초기화 할때 기본설정.
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    //page 이동이 끝났을때 호출되는 함수 -pageviewcontrollerdidfinish
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentTag = pageViewController.viewControllers?.first!.view.tag
        
        appDelegate.mainVC?.pageController.currentPage = currentTag!
    }

}
