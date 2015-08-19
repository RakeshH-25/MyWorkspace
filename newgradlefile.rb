class GradleFile
	
	def modify(path,section,version_code,version_name)
		text = File.read(path)
		
		text.gsub!(/(#{section}.*?versionCode\s*=*\s*)(\S+)(.*?})/m , '\1'+version_code+'\3')
		text.gsub!(/(#{section}.*?versionName\s*=*\s*)(\S+)(.*?})/m , '\1'+"\""+version_name+"\""+'\3')
		
		File.open(path, 'w') { |file| file.write(text) }	
	end
end

file="/home/rakesh/Downloads/build1.gradle"
GradleFile.new.modify(file, "UAT", "3.0", "3.0")