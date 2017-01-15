#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer

  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)

  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

   def initialize(content, line_number)  #CONSTRUCTOR
    self.highest_wf_words = []
    self.content = content
    self.line_number = line_number
    calculate_word_frequency
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.

   def calculate_word_frequency
    word_frequency = Hash.new(0)
    self.content.split.each do |word|
      word_frequency[word.downcase] += 1
    end
    self.highest_wf_count = word_frequency.values.max
    self.highest_wf_words = word_frequency.select { |k, v| v == highest_wf_count }.keys
  end
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
   def initialize  #CONSTRUCTOR
    self.analyzers = Array.new
  end

  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file
  def analyze_file
    if File.exist? 'test.txt'
      File.foreach( 'test.txt' ) do |line|
        self.analyzers << LineAnalyzer.new(line.chomp, $.)
      end
    end
  end

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  def calculate_line_with_highest_frequency
    self.highest_count_words_across_lines = []
    self.analyzers.max_by do |analyzer|
      self.highest_count_across_lines = analyzer.highest_wf_count
    end
    self.highest_count_words_across_lines += self.analyzers.select { |item| item.highest_wf_count == self.highest_count_across_lines }
  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format

  def print_highest_word_frequency_across_lines
    self.analyzers.each do |analyzer|
      puts "#{analyzer.highest_wf_words} (appears in line #{analyzer.line_number})" if self.highest_count_across_lines == analyzer.highest_wf_count
    end
  end
end
