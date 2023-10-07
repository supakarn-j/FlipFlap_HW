# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  NEWLINE = "\n"
  TAB = "\t"

  def take_tsv(tsv)
    tsv_content = tsv.split(NEWLINE)
    keys = tsv_content[0].split(TAB)
    @data = tsv_content[1..].map { |line| keys.zip(line.split(TAB)).to_h }
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys.join(TAB)
    @data.map { |line| line.values.join(TAB) }.reduce("#{headers}#{NEWLINE}") { |result, line| result + line + NEWLINE }
  end
end
