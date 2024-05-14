#1 
select date_format(charged_datetime,"%Y%m"), sum(amount)
from billing
where  date_format(charged_datetime,"%Y%m") = "201203"
group by date_format(charged_datetime,"%Y%m");

#2
select clients.client_id, concat(clients.first_name, ' ',clients.last_name) as client, sum(billing.amount)
from billing
join clients on billing.client_id = clients.client_id
where billing.client_id = 2
group by client;

#3
select * from sites
join clients on sites.client_id = clients.client_id
where sites.client_id = 10;

#4
SELECT clients.client_id, COUNT(sites.domain_name) AS number_of_websites, MONTHNAME(sites.created_datetime) AS month_created, YEAR(sites.created_datetime) AS year_created
FROM clients 
JOIN sites ON clients.client_id = sites.client_id where clients.client_id = 1 or clients.client_id = 20
GROUP BY month_created, year_created;

#5
SELECT sites.domain_name AS website, COUNT(leads.site_id) AS number_ofleads, YEAR(sites.created_datetime) AS fecha_created
FROM sites
JOIN leads ON sites.site_id = leads.site_id AND leads.registered_datetime >= '2011/01/01' AND leads.registered_datetime <= '2011/02/15'
GROUP BY website, fecha_created;

#6
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads.site_id) AS number_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id AND leads.registered_datetime >= '2011/01/01' AND leads.registered_datetime <= '2011/12/31'
GROUP BY clients.client_id
ORDER BY number_of_leads DESC;

#7
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads.site_id) AS number_of_leads, MONTHNAME(leads.registered_datetime) AS month_generated
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id AND YEAR(leads.registered_datetime) = 2011 AND MONTH(leads.registered_datetime) >= 1 AND MONTH(leads.registered_datetime) <= 6
GROUP BY clients.client_id, month_generated;

#8
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.site_id) AS number_of_leads, DATE_FORMAT(leads.registered_datetime, "%M" " %d" ', %Y' ) AS date_generate
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id AND YEAR(leads.registered_datetime) = 2011
GROUP BY website;
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.site_id) AS number_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
GROUP BY website;

#9
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS name, SUM(billing.amount) as total, MONTHNAME(billing.charged_datetime) AS month_charge, YEAR(billing.charged_datetime) AS year_charge
FROM Clients
LEFT JOIN billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id, month_charge, year_charge;

#10
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS name, GROUP_CONCAT('/',sites.domain_name) AS sites
FROM Clients
JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;


