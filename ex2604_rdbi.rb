<% require 'rdbi'%>
<% require 'rdbi-driver-sqlite3'%>

<% dbh = RDBI.connect(:SQLite3, database: 'fruits01.db')%>

<% sth = dbh.execute("select * from products").fetch(:all)%>

<% sth.each do |row| %>
  <ul>
  <% row.each do |val| %>
    <li><%= "#{val}" %></li>
  <% end %>
  <li>
<% end %>

<% dbh.disconnect%>
