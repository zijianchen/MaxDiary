### MaxDiary

手把手教你开发一个日记App (付详细开发流程) 适合新手及iOS开发者学习开发iOS项目流程 ，通过项目来更好了解iOS知识点

(持续更新项目及知识点，欢迎点🌟或Issues交流)

##### 需求分析

本次项目需完成以下功能需求，已完成则打勾

- [ ] 日记增删改查
- [ ] 日历
- [ ] 天气
- [ ] 分享
- [ ] 日记加密



##### 在本项目中你可以学习到

1. 学习本地存储：

   - plist文件（属性列表） 
   - preference（偏好设置） 
   - NSKeyedArchiver（归档） 
   - CoreData

2. 学习MVC设计架构

3. App 生命周期

4. iOS UI 控件使用(但不限于以下)

   - UIView
   - UIButton
   - UILabel
   - UITableView （重点：实际项目开发中常用）
   - UIImageView

5. iOS 控制器使用

   - UITabBarController 
   - UINavigationController 

6. iOS 三大特性

   - 继承
   - 封装
   - 多态

7. 使用 CocoaPods管理第三方库，该项目使用到的第三方库有(以下都是项目开发常用第三方库)：

   - MBProgressHUD   // 提示框
   - Reachability           // 网络状态检测 
   - AFNetworking       // 项目开发最常用的第三方库，需要熟练使用，有空建议研究一下其实现原理
   - MJRefresh              // 常用于上拉加载更多与下拉刷新效果

8. *iOS*核心*动画* CoreAnimation框架使用

9. CoreLocation框架使用

10. KVC 和KVO：基于NSKeyValueCoding非正式协议实现的机制

    

    

    

##### 项目开发规范

详情见我的 [iOS开发编码规范](https://github.com/zijianchen/CodeGuideOfIOS)

##### 项目开发流程🌟

注意：

- 本项目使用 CocoaPods管理第三方管理工具，需要本地安装Cocoapods，具体安装百度或Google一下，这里暂不做详细介绍哈

#####  开发流程：

###### 开发前准备

1. 在项目根目录下运行命令```pod init```

2. 此时项目根目录会帮你生成有一个Podfile模块，在命令行输入命令```vi Podfile```

3. 填写输入依赖的第三方库：当前开发版本('~> 3.1.0'，指的是版本号范围: 3.1.0 <= version <= 3.2)

   remark：规定当前库版本原因：若是团队协作开发，则需要注意开发环境一致

   ```
     pod 'AFNetworking', '~> 3.1.0'
     pod 'Reachability', '~> 3.2'
     pod 'MBProgressHUD', '~> 1.0.0'
     pod 'MJRefresh', '~> 3.1.15'
   ```

4. 运行命令```pod install```


5. 在根目录找到xcworkspace后缀文件，点击打开进行开发

###### 开发所需配置文件

1. 创建并配置pch文件：方便你一次性导入在多个文件中同时用到的头文件、宏或者URL地址等(全局使用)，可以有效的帮你节约时间，提高开发效率
2. 配置MaxDiary.xcdatamodeld：点击xcdatamodeld文件->点击AddEntity->再双击上方的实体名，输入想要的实体名。(注意：实体名一定要大写)

###### 开发思路

1. 创建UITabBarController 为主控制器，同时设为windows根视图


