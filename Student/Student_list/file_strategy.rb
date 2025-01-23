require 'json'
require 'yaml'

class FileStrategy

    def load_students(file_path)
        raise NotImplementedError
    end

    def save_students(file_path, data)
        raise NotImplementedError
    end

end