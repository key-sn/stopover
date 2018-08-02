class Stop < ActiveRecord::Base
  validates :name, presence: true

  # attr_accessor :money
  # serialize :money, Array
  # def number
  #   a = Stop.find(1)
  #   b = Stop.find(2)
  #   c = Stop.find(3)
  #   d = a.train2
  #   e = a.train1 + b.train2
  #   if e < d then
  #     return e
  #   else
  #     return d
  #   end
  # end
  def convert(i,isIC)
    # puts isIC == 1
    if isIC.to_i == 1
      re = Over.find(i).bill.split(',').map { |m| m.delete('[]"\\\\')}.map(&:to_i)
    else
      re = Stop.find(i).bill.split(',').map { |m| m.delete('[]"\\\\')}.map(&:to_i)
    end
    return re
  end
  def sumple(starttrain,finishtrain,isIC)
    station = []
    d2s = []
    s2a = []
    id_start = Stop.find_by(name: starttrain).id #乗る駅のid
    id_finish = Stop.find_by(name: finishtrain).id #降りる駅のid
    # id_start = Stop.find_by(name: "池袋").id #乗る駅のid
    # id_finish = Stop.find_by(name: "横浜").id #降りる駅のid
    start = convert(id_start,isIC) #乗る駅のbill配列
    finish = convert(id_finish,isIC) #降りる駅のbill配列
    direct_cost = start[id_finish-1]

    if id_start < id_finish
      id_min = id_start
      id_max = id_finish
    else
      id_min = id_finish
      id_max = id_start
    end
    i = id_min + 1
    while i < id_max do
          sum = start[i-1] + finish[i-1]
            if sum < direct_cost
              station << Stop.find(i).name
              d2s << start[i-1]
              s2a << finish[i-1]
            end
          i += 1
    end
    return direct_cost, station, d2s, s2a
  end
end
