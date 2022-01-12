ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
      div class: 'dashboard-report' do
        h1 "Reports", style: 'font-size:20px; font-weight: bold'
        br
        render 'report', households: current_admin_user.bhw? ? Household.all.where(barangay_id: current_admin_user.barangay_id) : Household.all
      end
  end
end
