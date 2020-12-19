#
# Be sure to run `pod lib lint StagLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StagLayout'
  s.version          = '1.0.4'
  s.summary          = 'Mixture of 2x2 and 2x1 grids for CollectionViewLayout'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Custom UICollectionViewLayout for iOS that supports staggered layout for 2x2 (or 2x1) grids
                       DESC

  s.homepage         = 'https://github.com/inderdhir/StagLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Inder Dhir' => 'inderdhir@hotmail.com' }
  s.source           = { :git => 'https://github.com/inderdhir/StagLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/StagLayout/**/*'
end
