class Cardtime < ActiveRecord::Base
	require 'CSV'

	def self.import(file)
	  CSV.foreach(file.path, headers: false) do |row|
			Cardtime.create(up_data: row)
	  end # end CSV.foreach
	end # end self.import(file)

	def self.import_b(file,ou_id=1)
		# v = Set.new
		v = []
	  CSV.foreach(file.path, headers: false) do |row| 
			arr = row[0].split('!') 
			cardno = arr[1]
			dtime = arr[2]
			v.<<("('#{cardno}',#{ou_id},'#{row[0]}','#{Time.now.utc.to_s[0..18]}','#{Time.now.utc.to_s[0..18]}')")
	  end # end CSV.foreach

		sql = "INSERT INTO cardtimes (cardno, ou_id, up_data, created_at, updated_at) VALUES #{v.join(", ")}"
	  run_sql = ActiveRecord::Base.connection
	  run_sql.execute(sql)
	  return v.size
	end # end self.import(file)

end
