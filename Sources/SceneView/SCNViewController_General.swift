//
//  File.swift
//  
//
//  Created by Jacob Martin on 6/22/19.
//

import Foundation
import SceneKit

extension SCNViewController {
    
    public convenience init(viewFrame:CGRect?, viewOptions:[String:Any]? = [:]) {
        self.init(nibName: nil, bundle: nil, viewFrame: viewFrame, viewOptions: viewOptions)
    }
    
    @objc public var scnView: SCNView {
        return self.view as! SCNView
    }
    @objc open var scene: SCNScene? {
        return self.scnView.scene
    }
    
    public override func loadView()
    {
        self.view = {
            let view = SCNView(frame: _initViewFrame, options: _initViewOptions)
            if #available(iOS 9.0, tvOS 9.0, *), NSClassFromString("AVAudioEngine") != nil {
                _ = view.audioEngine
            }
            return view
        }()
    }
    
    public override func viewDidLoad()
    {
        self.scnView.scene = SCNScene()
        
        super.viewDidLoad()
    }
}
