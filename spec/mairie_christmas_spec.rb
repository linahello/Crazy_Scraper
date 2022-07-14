require_relative '../lib/mairie_christmas'

describe 'we are getting the right mail for the right town' do
  it 'vérifies 2 towns' do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/aincourt.html")).to eq("mairie.aincourt@wanadoo.fr")
  end
end

describe 'we are getting the right number of urls' do
  it 'vérifies that' do
    expect(get_townhall_urls.count).to eq(185)
    expect(get_townhall_urls.include?("./95/frouville.html")).to eq(TRUE)
    expect(get_townhall_urls.class).to eq(Array)
  end
end

describe 'we are great dev' do
  it 'vérifies that' do
    expect(get_townhall_name.count).to eq(185)
    expect(get_townhall_name.include?("FROUVILLE")).to eq(TRUE)
    expect(get_townhall_urls.class).to eq(Array)
  end
end

describe 'test on final array' do
  it 'verify the number of arguments' do
    expect(create_final_array.count).to eq(185)
  end
  it 'verify the type class' do
    expect(create_final_array.class).to eq(Array)
  end
  it 'verify the type class' do
    expect(create_final_array[1].class).to eq(Hash)
  end
end