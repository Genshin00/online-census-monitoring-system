class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  
  def authorized?(action, subject = nil)
    if user.admin?
      return true
    end

    if user.bhw?
      case subject
      when ActiveAdmin::Page
        return true
      when normalized(Announcement)
        return action == :read
      when normalized(HouseholdPerson)
        return true if action == :create
      when normalized(Household)
        return true if action == :read || action == :create
        return true if action == :update && subject.barangay_id == user.barangay_id
        return false
      when normalized(ActiveAdmin::Comment)
        return true if action == :read || action == :create
        return true if action == :destroy && subject.author_id == user.id
      when normalized(AdminUser)
        return false
      else
        return false
      end
    end

    return false
  end
end