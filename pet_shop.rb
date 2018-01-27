def pet_shop_name(shop)
  return shop[:name]
end


def total_cash(shop)
  return shop[:admin][:total_cash]
end


def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end


def pets_sold(shop)
  return shop[:admin][:pets_sold]
end


def increase_pets_sold(shop, number_sold)
  return shop[:admin][:pets_sold] += number_sold
end


def stock_count(shop)
  pets_list = shop[:pets]
  stock = 0
  for pet in pets_list
    stock = stock + 1
  end
  return stock
end


def pets_by_breed(shop, breed)
  pets_found = []
  pets_list = shop[:pets]
  for pet in pets_list
    if pet[:breed] == breed
      pets_found << pet
    end
  end
  return pets_found
end


def find_pet_by_name(shop, pet)
  pets_list = shop[:pets]
  found_pet = nil
  for i in pets_list
    if i[:name] == pet
      found_pet = i
    end
  end
  return found_pet
end


def remove_pet_by_name(shop, pet_name)
  pets_list = shop[:pets]
  for pet in pets_list
    if pet[:name] == pet_name
      shop[:pets].delete(pet)
    end
  end
end


def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end


def customer_pet_count(customer)
  count = 0
  for i in customer[:pets]
    count += 1
  end
  return count
end


def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end


def customer_can_afford_pet(customer, pet)
  solvent = false
  if customer[:cash] >= pet[:price]
    solvent = true
  end
  return solvent
end



def sell_pet_to_customer(shop, pet, customer)

  if pet == nil
    return "Alas, there is no pet by that name for sale."
  else
    pet_cost = pet[:price]
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      remove_pet_by_name(shop, pet)
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet_cost)
      return pet
    else
      return "Unfortunately, the customer has insufficient funds for that purchase."
    end
  end
end
