
Pod::Spec.new do |s|
  s.name                   = 'Compose'
  s.version                = '1.2.3'
  s.summary                = 'Stop dealing with dataSources and delegates. Use compose to create your collectionView/tableView.'
  s.description            = <<-DESC
Compose is a data-driven library that will help encapsulate and isolate all the information needed to display a view inside some container (UICollectionView/UITableView), so you don't need to handle with all dataSource/delegate methods. 
                       DESC

  s.homepage               = 'https://github.com/vivareal/Compose'
  s.documentation_url      = 'https://vivareal.github.io/Compose/index.html'
  s.license                = { :type => 'MIT', :file => 'LICENSE' }
  s.author                 = { 'Bruno Bilescky' => 'brunogb@gmail.com' }
  s.source                 = { :git => 'https://github.com/vivareal/Compose.git', :tag => s.version.to_s }
  s.ios.deployment_target  = '8.0'
  s.frameworks             = 'UIKit'
  s.source_files           = 'Compose/Classes/**/*'
  
end
