@humans = 10
@machines = 10

def luck?
  rand(0..1) == 1
end

def boom
  diff = rand(1..5)
  if luck?
    @machines -= diff
    puts "#{diff} машин уничтожено"
  else
    @humans -= diff
    puts "#{diff} людей погибло"
  end
end

def random_city
  dice = rand(1..5)
  if dice == 1
    'Москва'
  elsif dice == 2
    'Лос-Анджелес'
  elsif dice == 3
    'Пекин'
  elsif dice == 4
    'Лондон'
  else
    'Сеул'
  end
end

def random_sleep
  sleep rand(0.3..1.5)
end

def stats
  puts "Осталось #{@humans} людей и #{@machines} машин"
end

def event_1
  puts "Запущена ракета по городу #{random_city}"
  random_sleep
  boom
end

def even_2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  random_sleep
  boom
end

def event_3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  random_sleep
  boom
end

def check_victory?
  if @humans <= 0
    puts "Машины победили"
  elsif @machines <= 0
    puts "Люди победили"
  end
end

loop do
  check_victory?
  break if @humans <= 0 || @machines <= 0

  dice = rand(1..3)

  case dice
  when 1
    event_1
  when 2
    even_2
  when 3
    event_3
  end
  stats
  random_sleep
end
