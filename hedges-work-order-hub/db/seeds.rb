#? S T A F F   M E M B E R   S E E D = = ==============================
test_sm_list = [
    ["Richie", "Hitchie", "doof@doof.com", "RanchHand", "123456"],
    ["Jeff", "Jeffney", "jeff@jeff.com", "SpiderWoman", "555"],
    ["V", "Que", "v@v.com", "Queen", "12345"]
]
test_sm_list.each do |fn, ln, e, po, pw|
    StaffMember.create(:first_name => fn, :last_name => ln, :email => e, :position => po, :password => pw)
end

#? B U I L D I N G    S E E D = = ==============================
b_list = [
    ["405Z", "Starkyle Boulevard", 2],
    ["FAKE#NUM", "ROAD STREET", 1],
    ["401A", "Brentwood Road", 2]
]
b_list.each do |n, sa, smid|
     Building.create(:number => n, :street_address => sa, :staff_member_id => smid)
end

#? A P A R T M E N T  S E E D = = ==============================
a_list = [
    ["1A", 1, 1],
    ["4B", 2, 2],
    ["12Z", 3, 3]
]
a_list.each do |n, smid, bid|
a = Apartment.create(:number => n, :staff_member_id => smid, :building_id => bid)
end

#? T E N A N T   S E E D = = ==============================
# test_t_list = [
#     ["Jakoby", "Disdale", 1, 1],
#     ["Martha", "Vineward", 1, 1],
#     ["Lola-Finnicker-Dresdenelle", "Lawry", 3, 3]
# ]
# test_t_list.each do |fn, ln, smid, aid|
#     Tenant.create(:name => "#{fn} #{ln}", :first_name => fn, :last_name => ln, :staff_member_id => smid, :apartment_id => aid)
# end

#? W O R K   O R D E R   S E E D = = ==============================
# test_w_list = [
    # ["PENDING - ACTION", "helluva sink to be clogged on a day like today", "", "", "", 2, nil, 3, 2],
    # ["COMPLETE - ACTION APPENDED", "Squirrels were complaining about the tea again.", "Bring them new tea packets of genuine quality", nil, "Vee Vellen",  3, nil, 2, 3]
# ]
# test_w_list.each do |st, c, sol, sd, w, smid, tid, bid, aid|
    # WorkOrder.create(:status => st, :content => c, :solution => sol, :solve_date => sd, :worker => w, :staff_member_id => smid, :tenant_id => tid, :building_id => bid, :apartment_id => aid)
# end

