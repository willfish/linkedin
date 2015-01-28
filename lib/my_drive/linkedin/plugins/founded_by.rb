module MyDrive
  module Linkedin
    class FoundedBy

      attr_reader :input_files, :output_dir

      def initialize(input_files,output_dir)
        @input_files = input_files
        @output_dir = output_dir
      end

      def process

      end

      

      years = {}

      files.each do |file|
        data = JSON.load(File.read(File.join("data/telematics", file)))
        y = data['companies']['values'].map {|company| company['foundedYear'] }.compact.uniq
        y.each do |year|
          data['companies']['values'].each do |company|
            if company['foundedYear'] == year
              if years[year]
                years[year] = years[year] + 1
              else
                years[year] = 1
              end
            else
              next
            end
          end
        end
      end

      CSV.open("founded_year.csv", "wb") do |csv|
        csv << [ 'yearFounded', 'count']
        years.to_a.each {|year| csv << year}
      end

    end
  end
end
