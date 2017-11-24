module TwitsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_twits_path
    elsif action_name == 'edit'
      twit_path
    end
  end
end
