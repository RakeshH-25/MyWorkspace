require "test/unit"

class GradleFile
	
	def modify(path,section,version_code,version_name)
		start_sub = false
		code_sub = false
		name_sub = false
		code_sub_line = ""
		name_sub_line = ""

		File.open(path, "r+").each_line do |line|
		  	if line[/#{section}\s{/] and start_sub == false
		  		puts line
		  		start_sub = true
		  	end

		  	if start_sub
		  		
		  		if line[/versionCode/] and code_sub == false
		  			p line
		  			code_sub_line = line
		  			substitute(path,code_sub_line,"versionCode #{version_code}\n")
		  			code_sub = true
		  		end
		  		
		  		if line[/versionName/] and name_sub == false
		  			p line
		  			name_sub_line = line
		  			substitute(path,name_sub_line,"versionName \"#{version_name}\"\n")
		  			name_sub = true
		  		end
		  		
		  	end
		end
		
	end

	def substitute(path, old_val, new_val)
		File.write(f = "#{path}", File.read(f).gsub(/#{old_val}/,"\t#{new_val}"))
	end
end

file="/home/rakesh/Downloads/build1.gradle"
 day = GradleFile.new.modify(file, "DEV", "12345", "Example")
 puts day