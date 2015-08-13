class Cardtime < ActiveRecord::Base
	require 'CSV'

	def self.create_5x(str_a,arr_b) 
    cols = str_a.dup 
    now = Time.now.to_s[0..15] 
    rows = []

    arr_b.each do |i|
    	x = '(' << i.dup << now << now << ')'
    	rows = rows << x 
    end

    
    cols << 'created_at' << 'updated_at'
    cols = cols.join(',')
    rows = rows.join(',')

		return "INSERT INTO #{table_name} (#{cols}) VALUES (#{rows})"
	end

	def self.import(file)
		# 將檔案資料存成 array在丟給 create 
		# 跟foreach 內就執行 create，速度差不多 
		# 所以在 foreach 內執行就好，吃的資源較少
		data = []
	  CSV.foreach(file.path, headers: false) do |row|
			# Cardtime.create(up_data: row)
			data<<{up_data: row}
	  end # end CSV.foreach
	  Cardtime.create(data)

	end # end self.import(file)

	def self.import_b(file)
		transaction do
  # 500.times { Model.create! }
	  CSV.foreach(file.path, headers: false) do |row|
			Cardtime.create(up_data: row)
	  end # end CSV.foreach
	  
	  end
	end # end self.import(file)	

	def self.import_c(file,ou_id=1)
		# v = Set.new
		v = []
		i = 0
	  CSV.foreach(file.path, headers: false) do |row| 
	  	i+=1
			arr = row[0].split('!') 
			cardno = arr[1]
			dtime = arr[2]
			v.<<("('#{cardno}',#{ou_id},'#{row[0]}','#{Time.now.utc.to_s[0..18]}','#{Time.now.utc.to_s[0..18]}')")
			if i%400 == 0  
				sql = "INSERT INTO cardtimes (cardno, ou_id, up_data, created_at, updated_at) VALUES #{v.join(", ")}"
			  run_sql = ActiveRecord::Base.connection
			  run_sql.execute(sql)
			  v = []
			end
	  end # end CSV.foreach
    if v.size > 0 
			sql = "INSERT INTO cardtimes (cardno, ou_id, up_data, created_at, updated_at) VALUES #{v.join(", ")}"
		  run_sql = ActiveRecord::Base.connection
		  run_sql.execute(sql)
		  return v.size
		end	
	end # end self.import(file)

end
