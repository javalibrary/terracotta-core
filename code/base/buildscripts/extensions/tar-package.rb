class BaseCodeTerracottaBuilder <  TerracottaBuilder
  protected
  def make_package(srcdir, destdir, filename, install_name, internal_name)
    ant.tar(:destfile => FilePath.new("#{destdir}", "#{filename}.tar.gz").to_s, :compression => 'gzip', :longfile => 'gnu') do
      ant.tarfileset(:dir => srcdir.to_s, :prefix => install_name, :excludes => "**/*.sh **/*.bat **/*.exe **/bin/** **/libexec/**") 
      ant.tarfileset(:dir => srcdir.to_s, :prefix => install_name, :includes => "**/*.sh **/*.bat **/*.exe **/bin/** **/libexec/**", :mode => 755) 
    end
  end
end