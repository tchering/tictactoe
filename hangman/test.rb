# frozen_string_literal: true

template = 'hello world'

FileUtils.mkdir_p('folder')

File.write('folder/hello.html', template)

template = 'hello world'
FileUtils.mkdir_p('folder')
file_name = 'folder/hello.html'

File.write(file_name, template)
