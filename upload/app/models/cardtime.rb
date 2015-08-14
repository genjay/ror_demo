class Cardtime < ActiveRecord::Base
	require 'CSV'

	def self.import(file)
		# 將檔案資料存成 array在丟給 create 
		# 跟foreach 內就執行 create，速度差不多 
		# 所以在 foreach 內執行就好，吃的資源較少
		data = []
	  CSV.foreach(file.path, headers: false) do |row|
			# Cardtime.create(up_data: row)
			data<<{up_data: row,cardno: row}
	  end # end CSV.foreach
	  Cardtime.f1_create(data)

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


	def self.f1_create(attributes = nil,bat_size=200)
		columns = attributes[0].keys 
    conn = ActiveRecord::Base.connection
		values,rows = '',''
		attributes.each_with_index do |h,i|
			h.each do |k,v| 
			  values << "'#{v.join(',')}',"
		  end
		  rows << "(#{values.chop}),"
		  values =''
		  if rows.size % bat_size == 0
				sql = "INSERT INTO #{table_name} (#{columns.join(',')}) VALUES #{rows.chop}"
		  	conn.execute sql
		  	rows =''
		  end
		end
    if rows.size > 0
		  sql = "INSERT INTO #{table_name} (#{columns.join(',')}) VALUES #{rows.chop}"
			conn.execute(sql)
		end

	end

end
