module UsersHelper
  def vote_result vote
    vote.to_s(2)
  end

  def generator_radio_vote_structure(vote, index, form)
    content = '<div class="col-auto form-check">'
    content += generate_radio_input(vote, index, '1', form)
    content += '<i class="form-check-label vote-box-label text-success bi bi-check2-circle"></i>'
    content += '</div>'
    content += '<div class="col-auto form-check">'
    content += generate_radio_input(vote, index, '0', form)
    content += '<i class="form-check-label vote-box-label fs-custom-1 text-danger bi bi-x-circle"></i>'
    content += '</div>'
    content.html_safe
  end

  private

  def generate_radio_input(vote, index, value, form)
    if !vote.nil? && vote_check(vote, index, value)
      form.radio_button :vote, value, class: 'form-check-input vote-box', checked: 'checked', name: 'association_user_invit[vote]['+index.to_s+']'
    else
      form.radio_button :vote, value, class: 'form-check-input vote-box', name: 'association_user_invit[vote]['+index.to_s+']'
    end
  end

  # Conversion du vote(Integer) en Base 2(String), on passe la Base 2 à 3 bits de longueurs pour récupérer les 0 omis par to_s(2)
  # Exemple : 3.to_s(2) => "11", on perd dans ce cas un Bit d'info si jamais on avait 3 restaurants dans l'invitation
  #
  # Le reverse est dû à la pondération des bits qui se fait dans le sens opposé de la lecture d'un string (si on devait le lire char by char)
  # Inverser coté serv aurait été plus simple, une autre méthode d'enregistrement de vote aussi d'ailleurs :)
  # Garder une reférence du restaurant sur chaque vote aurait plus de sens (on va dire que c'est de l'opti espace de stockage :D )
  def vote_check(vote, index, value)
    if vote.to_s(2).length < 2
      (vote.to_s(2).reverse << '00')[index] == value
    elsif vote.to_s(2).length < 3
      (vote.to_s(2).reverse << '0')[index] == value
    else
      vote.to_s(2).reverse[index] == value
    end
  end
end
