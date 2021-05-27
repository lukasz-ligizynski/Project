class HallRepository
  def all
    Hall.all
  end

  def find(id)
    Hall.find(id)
  end

  def new_entiti(attrs = nill)
    Hall.new(attrs)
  end

  def save(hall)
    hall.save
  end

  def delete(hall)
    hall.destroy
  end

  def update(attrs)
    Hall.update(attrs)
  end
end
