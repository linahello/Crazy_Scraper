require_relative '../lib/dark_trader'

1) Récupérer le cours de toutes les cryptomonnaies
Isoler les éléments HTML qui vont bien, 

2) les enregistrer dans un array de hashs
En extraire le texte et mettre ça dans un hash, 

3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.
Même si ça n'est pas le chemin le plus court, l'essentiel est que chaque petite 
étape te fasse avancer et qu'à chaque fois tu te dises "ok, étape 1), ça fonctionne nickel -
 pas de bug. Passons à la suite".

 un array crypto 
 un array value 




 require_relative '../lib/dark_trader'

describe 'we are getting all cryptos we can get' do
  it 'vérify if there is 20 cryptos' do
    expect(extract_crypto.length).to eq(20)
  end
  it 'verify that there is some current crypto' do
    expect(extract_crypto.include?("BTC")).to eq(true)
    expect(extract_crypto.include?("ETH")).to eq(true)
  end
end

describe 'we are getting all the values we can get and in the right format' do
  it 'vérify if there is 20 values' do
    expect(extract_values.length).to eq(20)
  end
  it 'verify that they are floats' do
    expect(extract_values[0].class).to eq(Float)
    expect(extract_values[10].class).to eq(Float)
  end
end

describe 'we have at the end an array of 20 hash' do
  it 'verify that the fnal list is an array' do
    expect(create_final_array.class).to eq(Array)
  end
  it 'verify that there are 20 elements' do 
    expect(create_final_array.length).to eq(20)
  end
  it 'verify that elements are hashes' do
    expect(create_final_array[0].class).to eq(Hash)
    expect(create_final_array[10].class).to eq(Hash)
  end
end
