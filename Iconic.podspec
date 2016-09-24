@version = '1.0.0-beta4'

Pod::Spec.new do |s|
  
  s.name            = 'Iconic'
  s.version         = @version
  s.summary         = 'Auto-generated icon font library for iOS [beta]'
  s.description     = 'Iconic will help you make icon fonts integration on iOS easy and effortless. Its main component is in charge of auto-generating strongly typed code in Swift, fully compatible with Objective-C, allowing the integration of vector icons as image or text in your apps.'
  
  s.homepage        = 'https://github.com/dzenbot/Iconic'
  s.screenshots     = ''
  s.author          = { 'Ignacio Romero Zurbuchen' => 'iromero@dzen.cl' }
  
  s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
  }
  
  s.source = {
      :git => 'https://github.com/dzenbot/Iconic.git',
      :tag => @version,
      :submodules => true
  }
  
  s.source_files    = 'Source/*.{swift}'
  s.resources       = 'Source/**/*.{ttf,otf}'
  s.preserve_paths  = 'Source/Catalog/**/*.*'
  s.framework       = 'UIKit', 'CoreText'
  
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  
  # If not specified, FontAwesome is used as the default font
  font_path = ENV['FONT_PATH'] ? ENV['FONT_PATH'] : 'Fonts/FontAwesome-4.6.3/FontAwesome.otf'
  
  s.prepare_command = <<-CMD
                      sh Installer.sh #{font_path}
                      CMD
end
