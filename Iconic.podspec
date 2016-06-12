@version = '1.0.0-beta1'

Pod::Spec.new do |s|

  s.name            = 'Iconic'
  s.version         = @version
  s.summary         = 'Lightweight interface for icon font integration with UIKit'
  s.description     = 'Description soon'

  s.homepage        = 'http://github.com/dzenbot/Iconic'
  s.screenshots     = ''
  s.author          = { 'Ignacio Romero Zurbuchen' => 'iromero@dzen.cl' }

  s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
  }

  s.source = {
      :git => 'http://github.com/dzenbot/Iconic.git',
      :tag => @version,
      :submodules => true
  }

  s.source_files    = 'Source/*.{swift}'
  s.resources       = 'Source/*.{ttf,otf}'
  s.preserve_paths  = 'Source/Iconizer/catalog/**/*.*'
  s.platform        = :ios, '8.0'
  s.framework       = 'UIKit', 'CoreText'
  
  # If not specified, FontAwesome is used as the default font
  font_path = ENV['FONT_PATH'] ? ENV['FONT_PATH'] : 'Example/Fonts/FontAwesome.ttf'

  s.prepare_command = <<-CMD
                      cd Vendor/SwiftGen/ && rake install
                      cd ../..
                      sh Source/Iconizer/Iconizer.sh #{font_path} Source/ --verbose
                      CMD

end
