require 'time'
require 'json'

class AccountingFileGenerator
  class NoUserFileName < StandardError
  end

  class UnsupportedDirection < StandardError
  end

  def self.add_record_to_line(line, offset, record, length)
    formatted_record = format("%-#{length}.#{length}s", record)

    line[offset..(offset + length)] = formatted_record
    return line
  end

  def self.generate_writing_line_for_software(invoice, writing_line)
    line = ' ' * 233 + "\r\n"

    offset = 0
    line[offset] = 'M'

    offset = 1
    line = add_record_to_line(line, offset, writing_line['account_number'], 8)

    offset = 9
    line = add_record_to_line(line, offset, writing_line['journal_code'], 2)

    offset = 11
    line = add_record_to_line(line, offset, writing_line['folio_number'], 3)

    offset = 14
    date = Time.parse(invoice['date']).strftime('%d%m%y')
    line = add_record_to_line(line, offset, date, 6)

    offset = 41
    raise UnsupportedDirection if writing_line['direction'].nil?
    line = add_record_to_line(line, offset, writing_line['direction'], 1)

    offset = 42
    amount_string = format('+%012.12d', writing_line['amount'].to_i)
    line = add_record_to_line(line, offset, amount_string, 13)

    offset = 55
    line = add_record_to_line(line, offset, writing_line['contrepartie'], 8)

    offset = 64
    date_echeance = Time.parse(invoice['date_echeance']).strftime('%d%m%y')
    line = add_record_to_line(line, offset, date_echeance, 6)

    offset = 107
    line = add_record_to_line(line, offset, writing_line['currency'], 3)

    offset = 110
    line = add_record_to_line(line, offset, writing_line['journal_code'], 3)

    offset = 113
    line[offset] = 'N'

    offset = 116
    libelle = "#{invoice['merchant_name']} #{invoice['external_reference']}"
    line = add_record_to_line(line, offset, libelle, 30)

    offset = 148
    line = add_record_to_line(line, offset, invoice['document_reference'], 10)

    offset = 181
    line = add_record_to_line(line, offset, invoice['file_name'], 12)

    line
  end
end

File.open('test_technique/writing.txt', "w") do |writing|
  JSON.parse(File.open('test_technique/invoices.json').read.sub("\n", '')).each do |invoice|
    invoice['writing_lines'].each do |writing_line|
      line = AccountingFileGenerator.generate_writing_line_for_software(invoice, writing_line)
      writing.puts(line)
    end
  end
end
