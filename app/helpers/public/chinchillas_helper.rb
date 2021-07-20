module Public::ChinchillasHelper
  def chinchilla_old(chinchilla)
    (Date.today.strftime('%Y%m%d').to_i - chinchilla.birthday.strftime('%Y%m%d').to_i) / 10000 
  end
end
